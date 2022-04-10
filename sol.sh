#!/usr/bin/env bash
# draumaz/sol, 2022
# MIT

if [ -z "$1" ]; then echo -n "Weather code: "; read i; else i=$1; fi
x="$2"
curl --silent https://weather.com/weather/today/l/$i | grep SunriseSunset | grep -oE "((1[0-2]|0?[1-9]):([0-5][0-9]) ?([AaPp][Mm]))" > /tmp/$i.out
t_rise="$(date --date="$(head -1 /tmp/$i.out)" +%R):00"
t_set="$(date --date="$(tail -1 /tmp/$i.out)" +%R):00"
rm /tmp/$i.out
if [ "$t_rise" == "00:00:00" ] || [ "$t_set" == "00:00:00" ]; then echo "Invalid weather code."; exit; fi
if [ -z "$x" ]; then echo -e "Sunrise: $t_rise\nSunset: $t_set"; fi
if [ "$x" == "rise" ]; then echo $t_rise; else if [ "$x" == "set" ]; then echo $t_set; fi fi
exit
