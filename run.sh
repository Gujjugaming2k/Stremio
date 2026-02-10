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
curl -sS https://raw.githubusercontent.com/Gujjugaming2k/site_scrap_mv/refs/heads/main/BKP_Stremio/settings.json -o Stremio/data/settings.json
curl -sS https://raw.githubusercontent.com/Gujjugaming2k/site_scrap_mv/refs/heads/main/BKP_Stremio/analytics.json -o Stremio/data/analytics.json

cd "$TARGET_DIR"

echo "[+] Installing dependencies..."
npm install --silent || yarn install --silent

echo "[+] Starting server.js in background..."
nohup node server.js > server.log 2>&1 &

echo "[+] Done. Server running in background."
echo "[+] Logs: $TARGET_DIR/server.log"

cd ..


ZIP_URL="https://github.com/Gujjugaming2k/site_scrap_mv/raw/main/M3U-XCAPI-EPG-IPTV-Stremio.zip"
TARGET_DIR="M3U-XCAPI-EPG-IPTV-Stremio"
ZIP_FILE="M3U-XCAPI-EPG-IPTV-Stremio.zip"



echo "[+] Downloading M3U-XCAPI-EPG-IPTV-Stremio.zip..."
curl -L "$ZIP_URL" -o "$ZIP_FILE"

echo "[+] Extracting ZIP..."
unzip -o "$ZIP_FILE" -d "$TARGET_DIR"

cd "$TARGET_DIR"

echo "[+] Installing dependencies..."
npm install --silent

echo "[+] Starting server.js in background..."
nohup npm start > TV.log 2>&1 &

echo "[+] Done. Server running in background."
echo "[+] Logs: $TARGET_DIR/TV.log"

cd ..


git clone https://github.com/Gujjugaming2k/m3u8proxyplayer.git
cd m3u8proxyplayer
npm i
nohup pnpm dev > m3u8proxyplayer.log 2>&1 &

cd ..

# fetch script
git clone https://github.com/Gujjugaming2k/IOSMIRROR_Fetch.git
cd IOSMIRROR_Fetch
npm i
nohup pnpm dev > IOSMIRROR_Fetch.log 2>&1 &

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


#hicin
ZIP_URL="https://github.com/Gujjugaming2k/site_scrap_mv/raw/refs/heads/main/BKP_Stremio/hic.zip"
TARGET_DIR="hic"
ZIP_FILE="hic.zip"



echo "[+] Downloading hic.zip..."
curl -L "$ZIP_URL" -o "$ZIP_FILE"

echo "[+] Extracting ZIP..."
unzip -o "$ZIP_FILE" -d "$TARGET_DIR"

cd "$TARGET_DIR"


echo "[+] Installing dependencies..."
npm install --silent

echo "[+] Starting server.js in background..."
nohup npm start > hic.log 2>&1 &

echo "[+] Done. Server running in background."
echo "[+] Logs: $TARGET_DIR/hic.log"

cd ..


#madplay
ZIP_URL="https://github.com/Gujjugaming2k/site_scrap_mv/raw/refs/heads/main/BKP_Stremio/rogflix.zip"
TARGET_DIR="rogflix"
ZIP_FILE="rogflix.zip"



echo "[+] Downloading rogflix.zip..."
curl -L "$ZIP_URL" -o "$ZIP_FILE"

echo "[+] Extracting ZIP..."
unzip -o "$ZIP_FILE" -d "$TARGET_DIR"

cd "$TARGET_DIR"


echo "[+] Installing dependencies..."
npm install --silent

echo "[+] Starting index.js in background..."
nohup node index.js > rogflix.log 2>&1 &

echo "[+] Done. Server running in background."
echo "[+] Logs: $TARGET_DIR/rogflix.log"

cd ..

#moviebox
ZIP_URL="https://github.com/Gujjugaming2k/site_scrap_mv/raw/refs/heads/main/BKP_Stremio/moviebox.zip"
TARGET_DIR="moviebox"
ZIP_FILE="moviebox.zip"



echo "[+] Downloading moviebox.zip..."
curl -L "$ZIP_URL" -o "$ZIP_FILE"

echo "[+] Extracting ZIP..."
unzip -o "$ZIP_FILE" -d "$TARGET_DIR"

cd "$TARGET_DIR"


echo "[+] Installing dependencies..."
npm install --silent

echo "[+] Starting index.js in background..."
nohup node addon.js > moviebox.log 2>&1 &

echo "[+] Done. Server running in background."
echo "[+] Logs: $TARGET_DIR/moviebox.log"

cd ..


#Vega
ZIP_URL="https://github.com/Gujjugaming2k/site_scrap_mv/raw/refs/heads/main/BKP_Stremio/vega-stremio-addon.zip"
TARGET_DIR="vega-stremio-addon"
ZIP_FILE="vega-stremio-addon.zip"



echo "[+] Downloading vega-stremio-addon.zip..."
curl -L "$ZIP_URL" -o "$ZIP_FILE"

echo "[+] Extracting ZIP..."
unzip -o "$ZIP_FILE" -d "$TARGET_DIR"

cd "$TARGET_DIR"
cd "vega-stremio-addon"
cd "stremio-addon"

echo "[+] Installing dependencies..."
npm install --silent

echo "[+] Starting server.js in background..."
nohup npm start > vega-stremio-addon.log 2>&1 &

echo "[+] Done. Server running in background."
echo "[+] Logs: $TARGET_DIR/vega-stremio-addon.log"

cd ..
cd ..
cd ..


#madplay
ZIP_URL="https://github.com/Gujjugaming2k/site_scrap_mv/raw/refs/heads/main/BKP_Stremio/anime.zip"
TARGET_DIR="anime"
ZIP_FILE="anime.zip"



echo "[+] Downloading anime.zip..."
curl -L "$ZIP_URL" -o "$ZIP_FILE"

echo "[+] Extracting ZIP..."
unzip -o "$ZIP_FILE" -d "$TARGET_DIR"

cd "$TARGET_DIR"


echo "[+] Installing dependencies..."
npm install --silent

echo "[+] Starting index.js in background..."
nohup node addon.js > anime.log 2>&1 &

echo "[+] Done. Server running in background."
echo "[+] Logs: $TARGET_DIR/anime.log"

cd ..



# hentaistream script
git clone https://github.com/Gujjugaming2k/hentaistream-addon.git
cd hentaistream-addon
npm i
nohup npm start > hentaistream.log 2>&1 &

cd ..



# multitml script
git clone https://github.com/Mehulittv/tml.git
cd tml
npm i
nohup node server.js > tml.log 2>&1 &

cd ..

#madplay
ZIP_URL="https://github.com/Gujjugaming2k/site_scrap_mv/raw/refs/heads/main/BKP_Stremio/meow.zip"
TARGET_DIR="meow"
ZIP_FILE="meow.zip"



echo "[+] Downloading meow.zip..."
curl -L "$ZIP_URL" -o "$ZIP_FILE"

echo "[+] Extracting ZIP..."
unzip -o "$ZIP_FILE" -d "$TARGET_DIR"

cd "$TARGET_DIR"
echo "[+] Installing dependencies..."
pip install -r requirements.txt

echo "[+] Starting index.js in background..."
nohup python -m meowtv.addon > meow.log 2>&1 &

echo "[+] Done. Server running in background."
echo "[+] Logs: $TARGET_DIR/meowtv.log"

cd ..


#Cine
ZIP_URL="https://github.com/Gujjugaming2k/site_scrap_mv/raw/refs/heads/main/BKP_Stremio/Cine.zip"
TARGET_DIR="Cine"
ZIP_FILE="Cine.zip"



echo "[+] Downloading Cine.zip..."
curl -L "$ZIP_URL" -o "$ZIP_FILE"

echo "[+] Extracting ZIP..."
unzip -o "$ZIP_FILE" -d "$TARGET_DIR"

cd "$TARGET_DIR"


echo "[+] Installing dependencies..."
npm install --silent

echo "[+] Starting index.js in background..."
nohup node addon.js > Cine.log 2>&1 &

echo "[+] Done. Server running in background."
echo "[+] Logs: $TARGET_DIR/Cine.log"

cd ..


git clone https://github.com/weebzone/Telegram-Stremio
cd Telegram-Stremio
echo 'QVBJX0lEPSIyMDA1NjMyMyIKQVBJX0hBU0g9IjFjN2FiNTlmZjliNjllZjg5OTEzOWU1OTZkM2ZkNWI1IgpCT1RfVE9LRU49Ijg0ODc0MjU2NTk6QUFFRnRPUXZfV1lUSWlzWHpNMzJVdXZwNXhzSWtrWXpQamciCkhFTFBFUl9CT1RfVE9LRU49Ijc5MDEwNjE0NTc6QUFFOFkwa3hsLUwxd2Fremd6MlhLc2hWdjltWEhyLXVWb1kiCk9XTkVSX0lEPSI3Njc5OTQ3MTMyIgpSRVBMQUNFX01PREU9InRydWUiCkhJREVfQ0FUQUxPRz0iZmFsc2UiClBBUkFMTEVMPSIxIgpQUkVfRkVUQ0g9IjEiCkFVVEhfQ0hBTk5FTD0iLTEwMDMxNDM2MTE2MzkiCkRBVEFCQVNFPSJtb25nb2RiK3NydjovL3RnLXN0cmVtaW8taDJyOjdPNzBpSWZCeEp0NUhlblpOUFpDelJTaEs0c0hsb3lyQGNsdXN0ZXIwLmlsY3U4cWcubW9uZ29kYi5uZXQvP3JldHJ5V3JpdGVzPXRydWUmdz1tYWpvcml0eSZhcHBOYW1lPUNsdXN0ZXIwLG1vbmdvZGIrc3J2Oi8vdGctc3RyZW1pby1oMnI6UERRazFmN0JlT2wzeEU5Qkt5eEU4UUFoZ0JkNW13bnhAY2x1c3RlcjAuc3FvMnN6bi5tb25nb2RiLm5ldC8/cmV0cnlXcml0ZXM9dHJ1ZSZ3PW1ham9yaXR5JmFwcE5hbWU9Q2x1c3RlcjAiClRNREJfQVBJPSJlM2M0N2Y4NmE4Y2VjYjg3MjFmOWNjNDVhMWUxYmE4ZiIKQkFTRV9VUkw9Imh0dHBzOi8vdGVsZWdyYW0udmZsaXguc2hvcC8iClBPUlQ9IjgwMDEiClVQU1RSRUFNX1JFUE89Imh0dHBzOi8vZ2l0aHViLmNvbS93ZWViem9uZS9UZWxlZ3JhbS1TdHJlbWlvIgpVUFNUUkVBTV9CUkFOQ0g9Im1hc3RlciIKQURNSU5fVVNFUk5BTUU9IlZGbGl4IgpBRE1JTl9QQVNTV09SRD0iOUR0SXc4aFBZUndNaXY0OXMmSzltIgpNVUxUSV9UT0tFTjE9IjgwOTAyNTQwNzI6QUFIbXJHeFZfWFluU3Vkams1QVE1VjFUNDRWeEhOczNvTTgiCg==' | base64 -d > config.env
curl -LsSf https://astral.sh/uv/install.sh | sh
source $HOME/.local/bin/env (sh, bash, zsh)
nohup bash start.sh > TelegramStremio.log 2>&1 &

cd ..

# Message to send
MESSAGE="All Script - Started"

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



