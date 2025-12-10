curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && sudo dpkg -i cloudflared.deb && sudo cloudflared service install eyJhIjoiNWIzNDA1ZDEzZmJiNWE1M2I2ZjM5ZjU4M2YwZmYwNjEiLCJ0IjoiYzA3YTI0MTQtNWI2My00ZmQ1LWIxM2EtMjgzNTJhNjJjNDk5IiwicyI6IlpqRXdNV1V4TkdJdFlUTTRaUzAwTnpreUxXRXhaVFF0T0dRMU56RXdNR1F6TWpBeiJ9
sudo /etc/init.d/cloudflared start
sudo /etc/init.d/cloudflared start
sudo /etc/init.d/cloudflared start

sudo chmod 777 *

mkdir -p stremio_scripts
curl -sS https://raw.githubusercontent.com/Gujjugaming2k/site_scrap_mv/main/BKP_Stremio/backup_to_github.py -o stremio_scripts/backup_to_github.py
curl -sS https://raw.githubusercontent.com/Gujjugaming2k/site_scrap_mv/main/BKP_Stremio/backup_runner.py -o stremio_scripts/backup_runner.py
sudo chmod 777 *
sudo chmod 777 Stremio/*
chmod +x Stremio/*
chmod +x Stremio/server.js
chmod +x /workspaces/FileStreamBot_2024/Stremio/server.js
nohup sudo python3 stremio_scripts/backup_runner.py > backup_runner.log 2>&1 &

pwd >> path.txt
id >> id.txt
nohup node /workspaces/FileStreamBot_2024/Stremio/server.js > /workspaces/FileStreamBot_2024/server.log 2>&1 &


