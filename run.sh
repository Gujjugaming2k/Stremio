curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && sudo dpkg -i cloudflared.deb && sudo cloudflared service install eyJhIjoiNWIzNDA1ZDEzZmJiNWE1M2I2ZjM5ZjU4M2YwZmYwNjEiLCJ0IjoiYzA3YTI0MTQtNWI2My00ZmQ1LWIxM2EtMjgzNTJhNjJjNDk5IiwicyI6IlpqRXdNV1V4TkdJdFlUTTRaUzAwTnpreUxXRXhaVFF0T0dRMU56RXdNR1F6TWpBeiJ9
sudo /etc/init.d/cloudflared start
sudo /etc/init.d/cloudflared start
sudo /etc/init.d/cloudflared start


mkdir -p /tmp/stremio_scripts
curl -sS https://raw.githubusercontent.com/Gujjugaming2k/site_scrap_mv/main/BKP_Stremio/backup_to_github.py -o /tmp/stremio_scripts/backup_to_github.py
curl -sS https://raw.githubusercontent.com/Gujjugaming2k/site_scrap_mv/main/BKP_Stremio/backup_runner.py -o /tmp/stremio_scripts/backup_runner.py
nohup python3 /tmp/stremio_scripts/backup_runner.py > /tmp/backup_runner.log 2>&1 &
nohup node /tmp/Stremio/server.js > server.log 2>&1 &
