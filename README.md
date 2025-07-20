คู่มือการใช้งาน Flask, Docker และ GitHub ใน VS Codeเอกสารนี้จะแนะนำขั้นตอนการสร้างเว็บแอปพลิเคชันด้วย Flask, แพ็คลง Docker container, และทำงานร่วมกับ GitHub โดยทั้งหมดนี้ทำผ่านโปรแกรม Visual Studio Codeสิ่งที่ต้องมีก่อนเริ่มติดตั้ง VS Code: ดาวน์โหลดที่นี่ติดตั้ง Docker Desktop: ดาวน์โหลดที่นี่ (และตรวจสอบให้แน่ใจว่า Docker กำลังทำงานอยู่)ติดตั้ง Git: ดาวน์โหลดที่นี่ติดตั้งส่วนขยาย (Extension) ใน VS Code:เปิด VS Code ไปที่หน้า Extensions (Ctrl+Shift+X)ค้นหาและติดตั้ง Docker (จาก Microsoft)ค้นหาและติดตั้ง Dev Containers (จาก Microsoft) - สำคัญมากสำหรับการพัฒนาอย่างจริงจังค้นหาและติดตั้ง GitLens (เสริมความสามารถให้ Git)[รูปภาพของ หน้าต่างส่วนขยาย VS Code ที่กำลังค้นหา Docker]ขั้นตอนที่ 1: เตรียมโปรเจกต์ Flaskก่อนอื่น ให้เปิดโฟลเดอร์โปรเจกต์ของคุณใน VS Codeสร้างไฟล์ app.py สำหรับ Flask:นี่คือโค้ดสำหรับเว็บแอปพลิเคชันง่ายๆ ที่จะแสดงข้อความเมื่อมีคนเข้ามาที่หน้าแรก# app.py
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return '<h1>Hello from Flask in a Docker container! 🐳</h1>'

# หมายเหตุ: เราไม่จำเป็นต้องมี app.run() ในไฟล์นี้
# เพราะเราจะใช้ Gunicorn ซึ่งเป็น Production Server ในการรันแอป
สร้างไฟล์ requirements.txt:ไฟล์นี้จะบอก Python ว่าโปรเจกต์ของเราต้องใช้ไลบรารีอะไรบ้างFlask
gunicorn
สร้าง Dockerfile:ไฟล์นี้คือ "พิมพ์เขียว" ที่บอก Docker ว่าจะสร้างสภาพแวดล้อมสำหรับเว็บแอป Flask ของเราอย่างไร# ใช้ Image ของ Python 3.13 เวอร์ชันเล็กเป็นพื้นฐาน
FROM python:3.13-slim

# กำหนดไดเรกทอรีที่จะทำงานภายใน Container
WORKDIR /app

# คัดลอกไฟล์ requirements.txt เข้าไปก่อน เพื่อใช้ประโยชน์จาก Docker cache
COPY requirements.txt .

# ติดตั้งไลบรารีที่โปรเจกต์ต้องการ
RUN pip install --no-cache-dir -r requirements.txt

# คัดลอกไฟล์โค้ดทั้งหมดที่เหลือเข้าไป
COPY . .

# เปิดพอร์ต 8000 ของ Container เพื่อให้ภายนอกเข้าถึงได้
EXPOSE 8000

# คำสั่งที่จะใช้รันเว็บแอปด้วย Gunicorn เมื่อ Container เริ่มทำงาน
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]
ขั้นตอนที่ 2: สร้าง Image (Build) ผ่าน VS Codeเปิด Command Palette: กด Ctrl+Shift+Pพิมพ์คำสั่ง Build: พิมพ์ Docker: Build Image... แล้วกด Enterเลือก Dockerfile และ ตั้งชื่อ Image (เช่น my-flask-app:latest)รอจน Build เสร็จ คุณจะเห็น Image ใหม่ในแถบด้านข้างของ Dockerขั้นตอนที่ 3: รัน Container (Run) ผ่าน VS Codeไปที่แถบ Docker (ไอคอนรูปวาฬ)ในส่วน "IMAGES", คลิกขวาที่ Image ของคุณ (my-flask-app) แล้วเลือก Runตรวจสอบ Container: Container ของคุณจะเริ่มทำงานและปรากฏในส่วน "CONTAINERS"เปิดเว็บเบราว์เซอร์: เข้าไปที่ http://localhost:8000 คุณจะเห็นข้อความจากแอป Flask ของคุณ!VS Code จะทำการเชื่อมต่อพอร์ต (port mapping) 8000 ของเครื่องคุณเข้ากับพอร์ต 8000 ของ Container โดยอัตโนมัติขั้นตอนที่ 4: การทำงานร่วมกับ GitHubตอนนี้เราจะนำโปรเจกต์ของเราขึ้นไปเก็บบน GitHubเปิดหน้า Source Control: ไปที่แถบ Source Control (Ctrl+Shift+G)Initialize Repository: คลิกที่ปุ่ม Initialize Repositoryสร้างไฟล์ .gitignore: สร้างไฟล์ชื่อ .gitignore แล้วใส่เนื้อหาต่อไปนี้:# ไฟล์ที่ถูกสร้างโดย Python
__pycache__/
*.pyc
.venv/

# ไฟล์ตั้งค่าของ VS Code
.vscode/
.devcontainer/

# ไฟล์ที่เกี่ยวกับ OS
.DS_Store
Commit และ Push โค้ด:ในช่อง Message พิมพ์ข้อความอธิบายการเปลี่ยนแปลง (เช่น "Add Flask app with Docker support")กด Commitเชื่อมต่อกับ GitHub Repository ของคุณ แล้วกด Publish Branch หรือ Sync Changes✨ ขั้นตอนที่ 5 (แนะนำ): พัฒนาภายใน Container โดยตรงด้วย Dev Containersสำหรับ การพัฒนาอย่างจริงจัง เพื่อให้สภาพแวดล้อมการพัฒนาของคุณเหมือนกับบนเซิร์ฟเวอร์จริง 100% นี่คือวิธีที่ดีที่สุดเปิด Command Palette (Ctrl+Shift+P) แล้วเลือก Dev Containers: Add Dev Container Configuration Files...เลือก "From a Dockerfile": VS Code จะถามหา Dockerfile ที่มีอยู่ ให้เลือกไฟล์นั้น VS Code จะสร้างโฟลเดอร์ .devcontainer พร้อมไฟล์ devcontainer.json ให้โดยอัตโนมัติReopen in Container: VS Code จะมีปุ่มแจ้งเตือนขึ้นมาที่มุมขวาล่าง ให้คลิก Reopen in Containerผลลัพธ์ที่ได้คือ:VS Code จะรีสตาร์ทและเชื่อมต่อเข้าไปใน Container โดยตรงTerminal ที่คุณเปิดใน VS Code (`Ctrl+``) จะเป็น Terminal ของ Containerคุณสามารถรัน, แก้ไข, และดีบักโค้ดได้ราวกับว่าคุณกำลังพัฒนาอยู่บนสภาพแวดล้อมนั้นโดยตรง ซึ่งเป็นวิธีที่ทรงพลังและป้องกันปัญหาเรื่องความแตกต่างของสภาพแวดล้อมได้ดีที่สุด
