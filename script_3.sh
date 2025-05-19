#!/bin/bash

while true; do
news=("php" "js" ".Net" "C#" "Cpp" "go" "rust" "python" "angular" "bash script" "Matlab")

ind=$((RANDOM % ${#news[@]}))

message=$(curl -s -X POST 'https://openai.jabirproject.org/v1/chat/completions' \
  -H 'Content-Type: application/json' \
  -d '{"model": "jabir-400b-online", "messages": [{"role": "system","content": "Generate news about whatever the user said, for example give the news title, news description, news link in the text data. Write Persian without additional text, display new news every time you request"}, {"role": "user","content": "'"${news[$ind]}"'"}]}' | jq -r '.choices[0].message.content')

curl -s -X POST "https://api.telegram.org/bot7880273029:AAGyPYWHEnT9-rD2sZYNZ822VO6-8r1WjDk/sendMessage" \
  -d "parse_mode=Markdown" \
  -d "chat_id=-1002376584189" \
  -d "text=$message" 2>/dev/null
echo "sended news"

sleep 10
don
