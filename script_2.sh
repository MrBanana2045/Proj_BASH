while true; do curl -s -X POST "https://api.telegram.org/bot***/sendMessage" -d "chat_id=-***&text=Coin price : $(printf "%.f\n" "$(curl -s 'https://api.tgju.org/v1/widget/tmp?keys=137138' | jq '.response | .indicators' | grep '"p":' | sed 's/"//g' | sed 's/p//g' | sed 's/://g' | sed 's/,//g' | sed 's/     //g')" | sed '/\./!s/$/./
:Loop
s/\([0-9]\)\([0-9]\{3\}[.,]\)/\1.\2/
t Loop
s/[.]$//
')"; sleep 59; done
