#!/bin/bash
sudo su - root
curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && sudo dpkg -i cloudflared.deb && sudo cloudflared service install eyJhIjoiNWIzNDA1ZDEzZmJiNWE1M2I2ZjM5ZjU4M2YwZmYwNjEiLCJ0IjoiYzA3YTI0MTQtNWI2My00ZmQ1LWIxM2EtMjgzNTJhNjJjNDk5IiwicyI6IlpqRXdNV1V4TkdJdFlUTTRaUzAwTnpreUxXRXhaVFF0T0dRMU56RXdNR1F6TWpBeiJ9
sudo /etc/init.d/cloudflared start
sudo /etc/init.d/cloudflared start
sudo /etc/init.d/cloudflared start


ZIP_URL="https://github.com/Gujjugaming2k/site_scrap_mv/raw/main/Stremio.zip"
TARGET_DIR="Stremio"
ZIP_FILE="Stremio.zip"

echo "[+] Creating target directory if not exists..."
mkdir -p "$TARGET_DIR"

echo "[+] Downloading Stremio.zip..."
curl -L "$ZIP_URL" -o "$ZIP_FILE"

echo "[+] Extracting ZIP..."
unzip -o "$ZIP_FILE" -d "$TARGET_DIR"



mkdir -p Stremio/data



curl -sS https://raw.githubusercontent.com/Gujjugaming2k/site_scrap_mv/refs/heads/main/BKP_Stremio/movies.json -o Stremio/data/movies.json
curl -sS https://raw.githubusercontent.com/Gujjugaming2k/site_scrap_mv/refs/heads/main/BKP_Stremio/series.json -o Stremio/data/series.json
curl -sS https://raw.githubusercontent.com/Gujjugaming2k/site_scrap_mv/refs/heads/main/BKP_Stremio/catalogs.json -o Stremio/data/catalogs.json
curl -sS https://raw.githubusercontent.com/Gujjugaming2k/site_scrap_mv/refs/heads/main/BKP_Stremio/users.json -o Stremio/data/users.json
curl -sS https://raw.githubusercontent.com/Gujjugaming2k/site_scrap_mv/refs/heads/main/BKP_Stremio/providers.json -o Stremio/data/providers.json

cd "$TARGET_DIR"

echo "[+] Installing dependencies..."
npm install --silent || yarn install --silent

echo "[+] Starting server.js in background..."
nohup node server.js > server.log 2>&1 &

echo "[+] Done. Server running in background."
echo "[+] Logs: $TARGET_DIR/server.log"

cd ..
curl -sS https://raw.githubusercontent.com/Gujjugaming2k/site_scrap_mv/main/BKP_Stremio/15_min.sh -o 15_min.sh
curl -sS https://raw.githubusercontent.com/Gujjugaming2k/site_scrap_mv/main/BKP_Stremio/bkp_data_stremio.sh -o bkp_data_stremio.sh
chmod +x 15_min.sh
chmod +x bkp_data_stremio.sh
nohup bash 15_min.sh > bkp_logs.log 2>&1 &

# Base64-encoded credentials
ENCODED_TOKEN="MTExODY0NTYyNDpBQUZzNHBBd3NMRG9vOTVjWDZwUGU5cEQxb0w1QjFoaTlzNA=="
ENCODED_CHANNEL_ID="LTEwMDIxOTY1MDM3MDU="

# Decode at runtime
BOT_TOKEN=$(echo "$ENCODED_TOKEN" | base64 --decode)
CHANNEL_ID=$(echo "$ENCODED_CHANNEL_ID" | base64 --decode)

# Message to send
MESSAGE="VFlixPrime Stremio - Started"

# Check if the message was sent successfully
if [ $? -eq 0 ]; then
    echo "Message sent successfully!"
else
    echo "Failed to send message."
fi

# Send the message using curl
curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
    -d chat_id="${CHANNEL_ID}" \
    -d text="${MESSAGE}" \
    -d parse_mode="Markdown"  # or "HTML" for HTML formatting


sudo pip install flask requests pycryptodome markupsafe

sudo wget -O vidzee.py https://raw.githubusercontent.com/Gujjugaming2k/site_scrap_mv/refs/heads/main/BKP_Stremio/vidzee.py
nohup sudo python3 vidzee.py &

curl -fsSL https://raw.githubusercontent.com/Gujjugaming2k/Rclone_Script/main/filesystem.sh | sudo bash
nohup sudo filebrowser -p 8021 >> filesystem_php_server.txt 2>&1 &

sleep 10
PASSWORD=$(grep "User 'admin' initialized with randomly generated password" filesystem_php_server.txt | awk -F': ' '{print $2}')

# Construct your message
MESSAGE="🛠️ *FTP Setup Started*  🔐 *Admin Password:* \`$PASSWORD\`"

# Send it to Telegram
curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
    -d chat_id="${CHANNEL_ID}" \
    -d text="${MESSAGE}" \
    -d parse_mode="Markdown"

# Check success
if [ $? -eq 0 ]; then
    echo "Telegram message sent!"
else
    echo "Failed to send Telegram message."
fi
sudo wget -O sleep3hr.sh https://raw.githubusercontent.com/Gujjugaming2k/Stremio/refs/heads/main/sleep3hr.sh
sudo chmod 777 sleep3hr.sh
bash sleep3hr.sh > /dev/null 2>&1 &
