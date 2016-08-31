#!/bin/bash
# Abort on error
set -e

echo -n "Insert vpk title ID [4 characters, uppercase] (Example: AAAA): "
read unique_id

echo -n "Insert Game Title: "
read title
 
# Make uppercase
unique_id=${unique_id^^}
# First 4 chars
unique_id=${unique_id:0:4}
 
vita-mksfoex -s "TITLE_ID=${unique_id}00001" "$title" build/sce_sys/param.sfo

pngquant assets/bg.png -o build/sce_sys/livearea/contents/bg.png
pngquant assets/icon0.png -o build/sce_sys/icon0.png
pngquant assets/startup.png -o build/sce_sys/livearea/contents/startup.png

echo ${unique_id}00001 > build/titleid.txt

cd build; zip ../${title}.vpk -r ./eboot.bin ./sce_sys
