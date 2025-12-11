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
# ✅ Message to Send
# -------------------------------
MESSAGE="Restart Script Placed ✅  
🕒 Current Time: $current_time  
🔜 Next Will Start: $future_time"

# -------------------------------
# ✅ Send Telegram Message
# -------------------------------
response=$(curl -s -o /dev/null -w "%{http_code}" \
  -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
  -d chat_id="${CHANNEL_ID}" \
  -d text="${MESSAGE}" \
  -d parse_mode="Markdown")

# -------------------------------
# ✅ Status Check
# -------------------------------
if [ "$response" -eq 200 ]; then
    echo "✅ Message sent successfully"
else
    echo "❌ Failed to send message (HTTP $response)"
fi


sleep 1h





# Decode at runtime
BOT_TOKEN=$(echo "$ENCODED_TOKEN" | base64 --decode)
CHANNEL_ID=$(echo "$ENCODED_CHANNEL_ID" | base64 --decode)

# Message to send
MESSAGE="3 hours pending"

# Check if the message was sent successfully
if [ $? -eq 0 ]; then
    echo "Message sent successfully!"
else
    echo "Failed to send message."
fi

sleep 1

# Decode at runtime
BOT_TOKEN=$(echo "$ENCODED_TOKEN" | base64 --decode)
CHANNEL_ID=$(echo "$ENCODED_CHANNEL_ID" | base64 --decode)

# Message to send
MESSAGE="2 hours pending"

# Check if the message was sent successfully
if [ $? -eq 0 ]; then
    echo "Message sent successfully!"
else
    echo "Failed to send message."
fi

sleep 1

# Decode at runtime
BOT_TOKEN=$(echo "$ENCODED_TOKEN" | base64 --decode)
CHANNEL_ID=$(echo "$ENCODED_CHANNEL_ID" | base64 --decode)

# Message to send
MESSAGE="1 hours pending"

# Check if the message was sent successfully
if [ $? -eq 0 ]; then
    echo "Message sent successfully!"
else
    echo "Failed to send message."
fi
sleep 45m

url="https://vflix.fun/github/github_token_date_v_1.php?type=create"

while true; do
  # Get the output and response code using curl
  response=$(curl -s -w "%{http_code}" "$url")
  output=$(echo "$response" | sed '$ d')
  http_code=$(echo "$response" | tail -n 1)

  # Print the output and response code
  echo "Output:"
  echo "$output"
  echo "HTTP Status Code: $http_code"

  # Check if status is 200
  if [ "$http_code" -eq 200 ]; then
    echo "✅ Success! Exiting loop."
    break
  else
    echo "⚠️ Request failed (code: $http_code). Retrying in 5 seconds..."
    sleep 10
  fi
done


# Decode at runtime
BOT_TOKEN=$(echo "$ENCODED_TOKEN" | base64 --decode)
CHANNEL_ID=$(echo "$ENCODED_CHANNEL_ID" | base64 --decode)

# Message to send
MESSAGE="VFlixPrime Stremio - New Started"

# Check if the message was sent successfully
if [ $? -eq 0 ]; then
    echo "Message sent successfully!"
else
    echo "Failed to send message."
fi
