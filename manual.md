คู่มือการใช้งานโปรเจกต์ Python ใน Dev Container (ขั้นตอนโดยละเอียด พร้อม Code Demo)คู่มือนี้จะให้คำแนะนำทีละขั้นตอนอย่างละเอียด พร้อมตัวอย่างโค้ดสาธิตสำหรับการตั้งค่า การใช้งาน และการพัฒนาโปรเจกต์ Python ของคุณภายในสภาพแวดล้อม Dev Container โดยใช้ VS Code และ Docker1. การตั้งค่าเริ่มต้น (Initial Setup)1.1. ข้อกำหนดเบื้องต้น (Prerequisites)ก่อนที่คุณจะเริ่มต้นใช้งานโปรเจกต์ ตรวจสอบให้แน่ใจว่าคุณได้ติดตั้งซอฟต์แวร์ที่จำเป็นทั้งหมดบนเครื่องคอมพิวเตอร์ของคุณแล้ว:ติดตั้ง Visual Studio Code (VS Code):ขั้นตอน:ไปที่เว็บไซต์อย่างเป็นทางการของ VS Code: https://code.visualstudio.com/ดาวน์โหลดและติดตั้ง VS Code ตามระบบปฏิบัติการของคุณ (Windows, macOS, Linux)การตรวจสอบ: เปิด VS Code เพื่อยืนยันว่าติดตั้งสำเร็จติดตั้ง Docker Desktop:ขั้นตอน:ไปที่เว็บไซต์ Docker Desktop: https://www.docker.com/products/docker-desktop/ดาวน์โหลดและติดตั้ง Docker Desktop สำหรับระบบปฏิบัติการของคุณหลังจากติดตั้งแล้ว ให้รัน Docker Desktop เพื่อให้แน่ใจว่า Docker Engine ทำงานอยู่เบื้องหลัง (คุณจะเห็นไอคอน Docker ใน System Tray/Menubar)การตรวจสอบ: เปิด Terminal บนเครื่องของคุณแล้วพิมพ์ docker --version คุณควรจะเห็นเวอร์ชันของ Docker แสดงขึ้นมาติดตั้ง VS Code Extensions ที่จำเป็น:ขั้นตอน:เปิด VS Codeไปที่ส่วน "Extensions" (ไอคอนสี่เหลี่ยมซ้อนกันทางซ้ายมือ หรือกด Ctrl+Shift+X / Cmd+Shift+X)ในช่องค้นหา (Search Extensions in Marketplace) ค้นหาและติดตั้งส่วนขยายต่อไปนี้ทีละรายการ:Dev Containers (ms-vscode-remote.remote-containers): สำหรับการทำงานกับ Dev ContainersPython (ms-python.python): สำหรับการสนับสนุนการพัฒนา PythonDocker (ms-docker.vscode-docker): สำหรับการจัดการ Docker images และ containersการตรวจสอบ: หลังจากติดตั้งแล้ว คุณจะเห็นส่วนขยายเหล่านั้นปรากฏในรายการ "Installed"1.2. การโคลน Repository (Cloning the Repository)ขั้นตอนนี้เป็นการดาวน์โหลดโค้ดโปรเจกต์จาก GitHub มายังเครื่องคอมพิวเตอร์ของคุณ:เปิด Terminal บนเครื่องของคุณ:บน Windows: เปิด Command Prompt หรือ PowerShell (ค้นหา "cmd" หรือ "powershell" ใน Start Menu)บน macOS/Linux: เปิด Terminal (ค้นหา "Terminal" ใน Spotlight/Applications)สำคัญ: ตรวจสอบให้แน่ใจว่าคุณกำลังใช้ Terminal ของเครื่องคุณ ไม่ใช่ Terminal ที่เชื่อมต่อกับ Dev Containerโคลนโปรเจกต์จาก GitHub:พิมพ์คำสั่ง git clone ตามด้วย URL ของ GitHub repository ของคุณ:git clone https://github.com/samritd/my-py-project-001.git
กด Enter เพื่อเริ่มการโคลนคุณจะเห็นข้อความแสดงความคืบหน้าของการดาวน์โหลดเข้าสู่ไดเรกทอรีโปรเจกต์:หลังจากโคลนเสร็จสิ้น คุณจะเห็นโฟลเดอร์ใหม่ชื่อ my-py-project-001 ในไดเรกทอรีปัจจุบันที่คุณรันคำสั่ง git cloneใช้คำสั่ง cd เพื่อเข้าไปยังโฟลเดอร์โปรเจกต์:cd my-py-project-001
การตรวจสอบ (Optional): คุณสามารถใช้คำสั่ง ls (macOS/Linux) หรือ dir (Windows) เพื่อดูเนื้อหาภายในโฟลเดอร์ เพื่อยืนยันว่าไฟล์โปรเจกต์ (เช่น main.py, Dockerfile) อยู่ในนั้น:ls
# หรือ
dir
คุณควรจะเห็นผลลัพธ์ประมาณนี้:Dockerfile  main.py  requirements.txt  .devcontainer
1.3. การเปิดโปรเจกต์ใน Dev Container (Opening in Dev Container)ขั้นตอนนี้จะเปิดโปรเจกต์ของคุณภายในสภาพแวดล้อม Dev Container ที่แยกต่างหาก ซึ่งมีเครื่องมือและไลบรารีที่จำเป็นทั้งหมด:เปิด VS Code:หาก VS Code ยังไม่ได้เปิดอยู่ ให้เปิดขึ้นมาเปิดโฟลเดอร์โปรเจกต์:ไปที่เมนู File > Open Folder... (หรือกด Ctrl+K Ctrl+O)เลือกโฟลเดอร์ my-py-project-001 ที่คุณเพิ่งโคลนมา (จากขั้นตอน 1.2) และคลิก "Select Folder" (หรือ "Open")รอการแจ้งเตือน Dev Container:เมื่อ VS Code เปิดโฟลเดอร์แล้ว ควรจะตรวจพบไฟล์ .devcontainer/devcontainer.json โดยอัตโนมัติคุณจะเห็นข้อความแจ้งเตือนปรากฏขึ้นที่มุมล่างขวาของหน้าจอ VS Code พร้อมข้อความว่า "Folder contains Dev Container configuration. Reopen in Container?"คลิก "Reopen in Container":คลิกที่ปุ่มสีเขียว "Reopen in Container" ในข้อความแจ้งเตือนนั้นหากคุณพลาดข้อความแจ้งเตือน คุณสามารถเปิด Command Palette (Ctrl+Shift+P / Cmd+Shift+P) และพิมพ์ "Dev Containers: Reopen in Container" เพื่อเลือกคำสั่งนี้ได้รอการสร้างและเชื่อมต่อคอนเทนเนอร์:VS Code จะเริ่มกระบวนการสร้าง Docker Image (หากยังไม่มี) และสร้าง Dev Container ใหม่จาก Image นั้นขั้นตอนนี้อาจใช้เวลาสักครู่ (2-5 นาที หรือนานกว่านั้นในการรันครั้งแรก) ขึ้นอยู่กับความเร็วอินเทอร์เน็ตและประสิทธิภาพของเครื่องคุณ เนื่องจากต้องดาวน์โหลด Docker Image และติดตั้งแพ็กเกจต่างๆ (รวมถึง Git ที่เราได้เพิ่มเข้าไปใน Dockerfile)คุณจะเห็นสถานะการทำงานที่มุมล่างซ้ายของ VS Code แสดงข้อความเช่น "Starting Dev Container (Python 3.12)..." หรือ "Building Dev Container..."ยืนยันการเชื่อมต่อ:เมื่อกระบวนการเสร็จสมบูรณ์ VS Code จะเปิดขึ้นมาใหม่ และคุณจะเห็น Terminal ที่เชื่อมต่ออยู่ภายในคอนเทนเนอร์Prompt ของ Terminal จะเปลี่ยนไปแสดงชื่อผู้ใช้และ ID คอนเทนเนอร์ เช่น root@<container-id>:/workspaces/my-py-project-001# ซึ่งยืนยันว่าคุณอยู่ในสภาพแวดล้อม Dev Container แล้วการตรวจสอบ Git (Optional): คุณสามารถลองพิมพ์ git --version ใน Terminal เพื่อยืนยันว่า Git ถูกติดตั้งอย่างถูกต้องภายในคอนเทนเนอร์:git --version
คุณควรจะเห็นผลลัพธ์ประมาณ: git version 2.50.1 (หรือเวอร์ชันใกล้เคียง)2. โครงสร้างโปรเจกต์ (Project Structure)โปรเจกต์ของคุณถูกจัดระเบียบด้วยไฟล์หลักและโฟลเดอร์ที่สำคัญดังต่อไปนี้:main.py:นี่คือไฟล์หลักของแอปพลิเคชัน Python ของคุณคุณจะเขียนโค้ด Python หลักของคุณในไฟล์นี้requirements.txt:ไฟล์ข้อความนี้ใช้สำหรับระบุไลบรารี Python ภายนอกทั้งหมดที่โปรเจกต์ของคุณต้องการเมื่อ Dev Container ถูกสร้างขึ้น pip จะอ่านไฟล์นี้และติดตั้งไลบรารีที่ระบุไว้โดยอัตโนมัติตัวอย่างเนื้อหา requirements.txt (หากมี):requests==2.31.0
beautifulsoup4==4.12.2
Dockerfile:เป็นไฟล์คำสั่งที่ใช้ในการสร้าง Docker Image สำหรับโปรเจกต์ของคุณไฟล์นี้จะกำหนด Base Image (เช่น python:3.12-slim-bookworm) ติดตั้งเครื่องมือระบบที่จำเป็น (เช่น git) คัดลอกไฟล์โปรเจกต์ และตั้งค่าสภาพแวดล้อมตัวอย่างเนื้อหา Dockerfile:FROM python:3.12-slim-bookworm

RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "main.py"]
.devcontainer/:นี่คือโฟลเดอร์พิเศษที่เก็บการตั้งค่าเฉพาะสำหรับ Dev Container.devcontainer/devcontainer.json:ไฟล์ JSON นี้คือไฟล์การตั้งค่าหลักสำหรับ Dev Container ของคุณมันกำหนด Docker Image ที่จะใช้, ส่วนขยาย VS Code ที่ควรติดตั้งภายในคอนเทนเนอร์, และคำสั่งต่างๆ ที่จะรันเมื่อคอนเทนเนอร์ถูกสร้าง (เช่น postCreateCommand)ตัวอย่างเนื้อหา .devcontainer/devcontainer.json:{
    "name": "Python 3.12 Development",
    "build": {
        "dockerfile": "../Dockerfile",
        "context": ".."
    },
    "customizations": {
        "vscode": {
            "extensions": [
                "ms-python.python",
                "ms-docker.vscode-docker",
                "ms-vscode-remote.remote-containers"
            ],
            "settings": {
                "python.pythonPath": "/usr/local/bin/python",
                "python.linting.pylintEnabled": true,
                "python.terminal.activateEnvironment": true
            }
        }
    },
    "postCreateCommand": "pip install --upgrade pip"
}
3. การรันแอปพลิเคชัน (Running the Application)เมื่อคุณอยู่ใน Dev Container แล้ว คุณสามารถรันแอปพลิเคชัน Python ของคุณได้โดยตรงจาก Terminal:เปิดไฟล์ main.py:ใน VS Code, คลิกที่ไฟล์ main.py ใน Explorer (แถบด้านซ้ายมือ) เพื่อเปิดไฟล์ขึ้นมาแก้ไขเพิ่มโค้ดตัวอย่างใน main.py (ถ้ายังไม่มี):หากไฟล์ main.py ของคุณว่างเปล่า หรือต้องการทดสอบการรัน ให้เพิ่มโค้ด Python ง่ายๆ ลงไป เช่น:# main.py
def greet(name):
    return f"สวัสดีครับ, {name}!"

if __name__ == "__main__":
    print(greet("Dev Container User"))
    print("นี่คือแอปพลิเคชัน Python ที่รันใน Dev Container!")
บันทึกไฟล์ (Ctrl+S / Cmd+S)เปิด Terminal ใน VS Code:หาก Terminal ยังไม่เปิดอยู่ ให้เปิดโดยไปที่เมนู Terminal > New Terminalรันไฟล์ main.py:ใน Terminal ที่เชื่อมต่อกับ Dev Container (ตรวจสอบให้แน่ใจว่า prompt ขึ้นต้นด้วย root@<container-id>:/workspaces/my-py-project-001# หรือคล้ายกัน) ให้พิมพ์คำสั่ง:python main.py
กด Enterตรวจสอบผลลัพธ์:คุณจะเห็นผลลัพธ์ของโค้ด Python ปรากฏใน Terminal ทันที:สวัสดีครับ, Dev Container User!
นี่คือแอปพลิเคชัน Python ที่รันใน Dev Container!
4. การพัฒนาและ Push การเปลี่ยนแปลง (Development and Pushing Changes)ส่วนนี้จะอธิบายขั้นตอนการแก้ไขโค้ด การเพิ่มไลบรารี และการส่งการเปลี่ยนแปลงของคุณไปยัง GitHub4.1. การแก้ไขโค้ด (Modifying Code)เปิดไฟล์ใน VS Code:คุณสามารถเปิดและแก้ไขไฟล์ใดๆ ในโปรเจกต์ของคุณ (เช่น main.py, Dockerfile) ได้ตามปกติใน VS Codeการเปลี่ยนแปลงที่คุณทำจะถูกบันทึกในระบบไฟล์ของ Dev Containerตัวอย่างการแก้ไข main.py:เปิดไฟล์ main.py อีกครั้งแก้ไขข้อความในฟังก์ชัน greet หรือเพิ่มบรรทัดใหม่:# main.py
def greet(name):
    return f"สวัสดีครับ, คุณ {name}!" # เปลี่ยนข้อความ

if __name__ == "__main__":
    print(greet("ผู้ใช้งาน")) # เปลี่ยนชื่อ
    print("นี่คือแอปพลิเคชัน Python ที่รันใน Dev Container!")
    print("เราได้ทำการแก้ไขโค้ดแล้ว!") # เพิ่มบรรทัดใหม่
บันทึกไฟล์ (Ctrl+S / Cmd+S)ทดสอบการเปลี่ยนแปลง:รัน main.py อีกครั้งใน Terminal เพื่อดูผลลัพธ์ของการแก้ไข:python main.py
คุณควรจะเห็นผลลัพธ์ที่อัปเดต:สวัสดีครับ, คุณ ผู้ใช้งาน!
นี่คือแอปพลิเคชัน Python ที่รันใน Dev Container!
เราได้ทำการแก้ไขโค้ดแล้ว!
4.2. การติดตั้งไลบรารีเพิ่มเติม (Installing Additional Libraries)หากโปรเจกต์ของคุณต้องการไลบรารี Python ใหม่ที่ยังไม่ได้ระบุใน requirements.txt:ตัวอย่างการใช้งานไลบรารี requests:สมมติว่าคุณต้องการใช้ไลบรารี requests เพื่อดึงข้อมูลจากเว็บไซต์เปิดไฟล์ main.py และเพิ่มโค้ดที่ใช้ requests (ตอนนี้จะยังรันไม่ได้เพราะยังไม่ได้ติดตั้ง):# main.py
import requests # เพิ่มบรรทัดนี้

def greet(name):
    return f"สวัสดีครับ, คุณ {name}!"

if __name__ == "__main__":
    print(greet("ผู้ใช้งาน"))
    print("นี่คือแอปพลิเคชัน Python ที่รันใน Dev Container!")
    print("เราได้ทำการแก้ไขโค้ดแล้ว!")

    # โค้ดที่ใช้ requests (จะเกิด Error ถ้ายังไม่ติดตั้ง)
    try:
        response = requests.get("https://www.google.com")
        print(f"สถานะการตอบกลับจาก Google: {response.status_code}")
    except Exception as e:
        print(f"เกิดข้อผิดพลาดในการดึงข้อมูล: {e}")
บันทึกไฟล์ (Ctrl+S / Cmd+S)ติดตั้งไลบรารีที่คุณต้องการ:เปิด Terminal ใน Dev Container (ตรวจสอบให้แน่ใจว่า prompt เป็นของคอนเทนเนอร์)ใช้คำสั่ง pip install ตามด้วยชื่อไลบรารี:pip install requests
คุณจะเห็นข้อความแสดงความคืบหน้าการติดตั้งบันทึกไลบรารีลงใน requirements.txt (สำคัญมาก!):หลังจากติดตั้งไลบรารีใหม่แล้ว คุณต้องบันทึกรายการไลบรารีทั้งหมดที่ติดตั้งในสภาพแวดล้อมปัจจุบันลงในไฟล์ requirements.txtสิ่งนี้จะช่วยให้แน่ใจว่าเมื่อผู้อื่นโคลนโปรเจกต์ของคุณ หรือเมื่อคุณสร้างคอนเทนเนอร์ใหม่ในอนาคต ไลบรารีที่จำเป็นทั้งหมดจะถูกติดตั้งโดยอัตโนมัติใช้คำสั่ง:pip freeze > requirements.txt
คำสั่งนี้จะเขียนทับเนื้อหาของ requirements.txt ด้วยรายการไลบรารีและเวอร์ชันที่ติดตั้งในปัจจุบันการตรวจสอบ: เปิดไฟล์ requirements.txt คุณจะเห็น requests==X.Y.Z (พร้อมเวอร์ชันที่ติดตั้ง) เพิ่มเข้ามาทดสอบโค้ดอีกครั้ง:รัน main.py อีกครั้งใน Terminal:python main.py
ตอนนี้คุณควรจะเห็นผลลัพธ์จากการใช้ไลบรารี requests ด้วย:สวัสดีครับ, คุณ ผู้ใช้งาน!
นี่คือแอปพลิเคชัน Python ที่รันใน Dev Container!
เราได้ทำการแก้ไขโค้ดแล้ว!
สถานะการตอบกลับจาก Google: 200
4.3. การ Commit และ Push การเปลี่ยนแปลง (Committing and Pushing Changes)เมื่อคุณพอใจกับการเปลี่ยนแปลงโค้ดและต้องการบันทึกการเปลี่ยนแปลงเหล่านั้นลงในประวัติ Git และส่งขึ้นไปยัง GitHub repository ของคุณ:เพิ่มไฟล์ที่เปลี่ยนแปลงเข้าสู่ Staging Area:นี่คือขั้นตอนในการบอก Git ว่าไฟล์ใดที่คุณต้องการรวมไว้ในการ commit ครั้งต่อไปใน Terminal ของ Dev Container ให้พิมพ์:git add .
คำสั่งนี้จะเพิ่มไฟล์ที่ถูกแก้ไข, เพิ่มใหม่, หรือลบทั้งหมดใน directory ปัจจุบันเข้าสู่ staging areaการตรวจสอบ (Optional): คุณสามารถใช้ git status เพื่อดูว่าไฟล์ใดบ้างที่ถูกเพิ่มเข้า staging แล้ว:git status
คุณควรจะเห็นไฟล์ที่คุณแก้ไข (เช่น main.py, requirements.txt) อยู่ในส่วน "Changes to be committed:"บันทึกการเปลี่ยนแปลง (Commit):นี่คือการสร้าง "snapshot" ของโค้ดของคุณในจุดเวลาหนึ่ง พร้อมกับข้อความอธิบายการเปลี่ยนแปลงพิมพ์คำสั่ง git commit พร้อมข้อความอธิบาย:git commit -m "Add requests library and update main.py content"
กด Enterคุณจะเห็นข้อความยืนยันการ commit เช่น:[main 123abc4] Add requests library and update main.py content
 2 files changed, 15 insertions(+), 1 deletion(-)
ส่งการเปลี่ยนแปลงขึ้น GitHub (Push):นี่คือขั้นตอนสุดท้ายในการส่ง commit ที่คุณสร้างขึ้นจาก local repository ของคุณไปยัง remote repository บน GitHubพิมพ์คำสั่ง:git push
กด Enterคุณอาจถูกขอให้ป้อนชื่อผู้ใช้และรหัสผ่าน GitHub หากเป็นครั้งแรก หรือหากไม่ได้ตั้งค่า Credential Helper ไว้คุณจะเห็นข้อความแสดงความคืบหน้าการ push และเมื่อเสร็จสิ้นจะแสดงข้อความคล้ายกับ:To https://github.com/samritd/my-py-project-001.git
   13e72b1..123abc4  main -> main
การตรวจสอบ: คุณสามารถไปที่ GitHub repository ของคุณในเว็บเบราว์เซอร์เพื่อยืนยันว่าการเปลี่ยนแปลงของคุณปรากฏอยู่แล้วหากคุณมีคำถามเพิ่มเติมหรือพบปัญหาในขั้นตอนใดๆ โปรดอย่าลังเลที่จะสอบถามได้เลยครับ!