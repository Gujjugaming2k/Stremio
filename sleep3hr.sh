sleep 3h
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
