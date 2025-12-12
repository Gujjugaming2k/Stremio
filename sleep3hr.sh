#!/bin/bash

# -------------------------------
# ✅ Time Calculations (IST)
# -------------------------------
now=$(TZ='Asia/Kolkata' date +%s)
future=$(($now + 3*3600 + 45*60 + 5))

current_time=$(TZ='Asia/Kolkata' date -d @$now +"%I:%M %p")
future_time=$(TZ='Asia/Kolkata' date -d @$future +"%I:%M %p")

echo "🕒 Current Time (IST): $current_time"
echo "🔜 Next Time After Sleep (IST): $future_time"

# -------------------------------
# ✅ Base64 Encoded Credentials
# -------------------------------
ENCODED_TOKEN="MTExODY0NTYyNDpBQUZzNHBBd3NMRG9vOTVjWDZwUGU5cEQxb0w1QjFoaTlzNA=="
ENCODED_CHANNEL_ID="LTEwMDIxOTY1MDM3MDU="

# Decode at runtime
BOT_TOKEN=$(echo "$ENCODED_TOKEN" | base64 --decode)
CHANNEL_ID=$(echo "$ENCODED_CHANNEL_ID" | base64 --decode)

# -------------------------------
# ✅ Send Restart Message
# -------------------------------
MESSAGE="Restart Script Placed ✅  
🕒 Current Time: $current_time  
🔜 Next Will Start: $future_time"

curl -s -o /dev/null -w "%{http_code}" \
  -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
  -d chat_id="${CHANNEL_ID}" \
  -d text="${MESSAGE}" \
  -d parse_mode="Markdown"

echo "✅ Restart message sent"

# -------------------------------
# ✅ WAIT 3 HOURS 45 MINUTES
# -------------------------------
sleep 1h


# -------------------------------
# ✅ 3 HOURS PENDING
# -------------------------------
MESSAGE="3 hours pending"
curl -s -o /dev/null -w "%{http_code}" \
  -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
  -d chat_id="${CHANNEL_ID}" \
  -d text="${MESSAGE}"

echo "✅ Sent: 3 hours pending"

sleep 1h

# -------------------------------
# ✅ 2 HOURS PENDING
# -------------------------------
MESSAGE="2 hours pending"
curl -s -o /dev/null -w "%{http_code}" \
  -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
  -d chat_id="${CHANNEL_ID}" \
  -d text="${MESSAGE}"

echo "✅ Sent: 2 hours pending"

sleep 1h

# -------------------------------
# ✅ 1 HOUR PENDING
# -------------------------------
MESSAGE="1 hours pending"
curl -s -o /dev/null -w "%{http_code}" \
  -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
  -d chat_id="${CHANNEL_ID}" \
  -d text="${MESSAGE}"

echo "✅ Sent: 1 hours pending"

sleep 50m

# -------------------------------
# ✅ LOOP UNTIL API RETURNS 200
# -------------------------------
url="https://vflix.fun/github/github_token_date_v_1.php?type=create"

while true; do
  response=$(curl -s -w "%{http_code}" "$url")
  output=$(echo "$response" | sed '$ d')
  http_code=$(echo "$response" | tail -n 1)

  echo "Output:"
  echo "$output"
  echo "HTTP Status Code: $http_code"

  if [ "$http_code" -eq 200 ]; then
    echo "✅ Success! Exiting loop."
    break
  else
    echo "⚠️ Request failed (code: $http_code). Retrying in 10 seconds..."
    sleep 10
  fi
done

# -------------------------------
# ✅ FINAL MESSAGE
# -------------------------------
MESSAGE="VFlixPrime Stremio - New Started"

curl -s -o /dev/null -w "%{http_code}" \
  -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
  -d chat_id="${CHANNEL_ID}" \
  -d text="${MESSAGE}"

echo "✅ Final message sent"
