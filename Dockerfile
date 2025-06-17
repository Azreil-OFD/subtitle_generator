FROM node:22-bookworm
WORKDIR /app
RUN apt-get update && apt-get install -y \
    git curl ffmpeg cmake \
    build-essential \
    libnss3 \
    libxss1 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libasound2 \
    libxshmfence1 \
    libgbm1 \
    libxrandr2 \
    libxdamage1 \
    libxcomposite1 \
    libxext6 \
    libxi6 \
    libxtst6 \
    libnss3 \
    libdrm2 \
    libx11-xcb1 \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*
COPY package*.json ./
RUN npm install
COPY . .
WORKDIR /app
RUN source download-model.sh
RUN node initial.mjs && mv /app/ggml-large-v1.bin /app/whisper.cpp/ggml-large-v1.bin
RUN chmod +x ./start.sh
CMD ["./start.sh"]