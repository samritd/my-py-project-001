# ใช้ Base Image ของ Python 3.12 (เหมือนกับที่คุณมีบน Ubuntu)
FROM python:3.12-slim-bookworm

# ติดตั้ง Git และเครื่องมือที่จำเป็นอื่นๆ
# apt-get update จะอัปเดตรายการแพ็กเกจ
# apt-get install -y git จะติดตั้ง Git แบบอัตโนมัติ (-y)
# --no-install-recommends จะช่วยลดขนาด image โดยไม่ติดตั้งแพ็กเกจที่ไม่จำเป็น
# rm -rf /var/lib/apt/lists/* จะลบไฟล์แคชของ apt เพื่อประหยัดพื้นที่
RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*

# กำหนด Working Directory ภายใน Container
WORKDIR /app

# คัดลอกไฟล์ requirements.txt ไปยัง Working Directory และติดตั้ง packages
# (แม้ว่าตอนนี้จะว่างเปล่า แต่เป็นการเตรียมพร้อมสำหรับอนาคต)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# คัดลอกไฟล์โค้ดทั้งหมดจากเครื่อง Host (ปัจจุบันคือโฟลเดอร์ my-awesome-python-app)
# ไปยัง Working Directory (/app) ใน Container
COPY . .

# กำหนดคำสั่งเริ่มต้นที่จะรันเมื่อ Container เริ่มต้นทำงานโดยไม่มีคำสั่งอื่นระบุ
CMD ["python", "main.py"]
