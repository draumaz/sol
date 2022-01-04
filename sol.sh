#!/bin/bash
# sol - a bloatless sunrise & sunset time fetcher.
# e.g. sol 77301 rise
# draumaz, 2021

x="$2"
if [ -z "$1" ]; then echo -n "Weather code: "; read i; else i=$1; fi
tmpfile=/tmp/$i.out
wget -q "https://weather.com/weather/today/l/$i" -O "$tmpfile" > /dev/null 2>&1
sr1=$(grep SunriseSunset "$tmpfile" | grep -oE '((1[0-2]|0?[1-9]):([0-5][0-9]) ?([AaPp][Mm]))' | head -1)
ss1=$(grep SunriseSunset "$tmpfile" | grep -oE '((1[0-2]|0?[1-9]):([0-5][0-9]) ?([AaPp][Mm]))' | tail -1)
srf=$(date --date="$sr1" +%R):00
ssf=$(date --date="$ss1" +%R):00
if [ "$srf" == "00:00:00" ] || [ "$ssf" == "00:00:00" ]; then echo "Invalid weather code."; fi
if [ -z "$x" ]; then echo -e "Sunrise: $srf\nSunset: $ssf"; fi
if [ "$x" == "rise" ]; then echo $srf; else if [ "$x" == "set" ]; then echo $ssf; fi fi
exit
