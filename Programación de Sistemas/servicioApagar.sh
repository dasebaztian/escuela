#!/usr/bin/env bash

bot_TOKEN="6725554548:AAFWWVwYCHe6pkGYkNcEOQd6W1r4KjrcOnQ"
bot_ID="818443054"

#url_text="https://api.telegram.org/bot$bot_TOKEN/sendMessage?chat_id=$bot_ID&parse_mode=Markdown&text=adios"

# curl -X GET "$url_text" 

fecha_anterior=""

while test "true"; do
    salida=$(curl -X POST "https://api.telegram.org/bot$bot_TOKEN/getUpdates" 2> /dev/null)
    mensaje=$(echo "$salida" | grep -Po "text\":\"\K[^\"]+" | tail -n 1)
    fecha_ultima=$(echo "$salida" | grep -Po "date\":\K[^,]+" | tail -n 1)
    if test "$fecha_ultima" != "$fecha_anterior"; then
		salida_mensaje=$("$mensaje")
		#curl -X POST "https://api.telegram.org/bot$bot_TOKEN/sendMessage?chat_id=$bot_ID&parse_mode=Markdown&text=$salida_mensaje"
		curl -s "https://api.telegram.org/bot$bot_TOKEN/sendMessage" -d "chat_id=$bot_ID&text=$salida_mensaje"
    fi
    sleep 5
    fecha_anterior="$fecha_ultima"
    echo "esperando mensaje..."
done

