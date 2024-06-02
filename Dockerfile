# Gunakan image dasar dari Python versi 3.11 slim
FROM python:3.11-slim

# Instal dependensi sistem yang diperlukan
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    wget \
    git \
    libgl1-mesa-glx \
    libglib2.0-0

# Tentukan direktori kerja
WORKDIR /app

# Salin semua file ke dalam direktori kerja di dalam container
COPY . .

# Instal dependensi Python yang diperlukan
RUN pip install --no-cache-dir -r requirements.txt

# Ekspos port yang akan digunakan oleh aplikasi
EXPOSE 8501

# Tentukan perintah untuk menjalankan aplikasi
ENTRYPOINT ["streamlit", "run", "/app/app.py", "--server.port=8501", "--server.address=0.0.0.0"]
