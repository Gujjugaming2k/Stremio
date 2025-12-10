mkdir -p /tmp/stremio_scripts
curl -sS https://raw.githubusercontent.com/Gujjugaming2k/site_scrap_mv/main/BKP_Stremio/backup_to_github.py -o /tmp/stremio_scripts/backup_to_github.py
curl -sS https://raw.githubusercontent.com/Gujjugaming2k/site_scrap_mv/main/BKP_Stremio/backup_runner.py -o /tmp/stremio_scripts/backup_runner.py
nohup python3 /tmp/stremio_scripts/backup_runner.py > /tmp/backup_runner.log 2>&1 &
nohup node /tmp/Stremio/server.js > server.log 2>&1 &
