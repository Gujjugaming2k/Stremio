#!/bin/bash
sudo su - root
curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && sudo dpkg -i cloudflared.deb && sudo cloudflared service install eyJhIjoiNWIzNDA1ZDEzZmJiNWE1M2I2ZjM5ZjU4M2YwZmYwNjEiLCJ0IjoiYzA3YTI0MTQtNWI2My00ZmQ1LWIxM2EtMjgzNTJhNjJjNDk5IiwicyI6IlpqRXdNV1V4TkdJdFlUTTRaUzAwTnpreUxXRXhaVFF0T0dRMU56RXdNR1F6TWpBeiJ9
sudo /etc/init.d/cloudflared start
sudo /etc/init.d/cloudflared start
sudo /etc/init.d/cloudflared start


ZIP_URL="https://github.com/Gujjugaming2k/site_scrap_mv/raw/main/Stremio.zip"
TARGET_DIR="/tmp/Stremio"
ZIP_FILE="/tmp/Stremio.zip"

echo "[+] Creating target directory if not exists..."
mkdir -p "$TARGET_DIR"

echo "[+] Downloading Stremio.zip..."
curl -L "$ZIP_URL" -o "$ZIP_FILE"

echo "[+] Extracting ZIP..."
unzip -o "$ZIP_FILE" -d "$TARGET_DIR"

cd "$TARGET_DIR"

echo "[+] Installing dependencies..."
npm install --silent || yarn install --silent

echo "[+] Starting server.js in background..."
nohup node server.js > server.log 2>&1 &

echo "[+] Done. Server running in background."
echo "[+] Logs: $TARGET_DIR/server.log"
