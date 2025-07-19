import os
import platform
import sys

print("--- Python Application Started ---")
print(f"Hello from Python running inside a Docker container!")
print(f"Python version: {platform.python_version()}")
print(f"Python executable: {sys.executable}")
print(f"Working directory: {os.getcwd()}")

# เพิ่มบรรทัดนี้เพื่อทดสอบ Debugging ในภายหลัง
name = input("What's your name? ")
print(f"Nice to meet you, {name}!")

print("--- Application Finished ---")