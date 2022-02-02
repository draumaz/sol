#!/bin/bash
# draumaz/sol, 2022
# GPL v3

x="$2"
if [ -z "$1" ]; then
	if [ ! -f $HOME/.config/sol-location ]; then
		echo -n "Weather code: "; read i
		echo $i > $HOME/.config/sol-location
	else
		i=$(cat $HOME/.config/sol-location)
	fi
else
	i=$1
fi
curl --silent https://weather.com/weather/today/l/$i | grep SunriseSunset | grep -oE "((1[0-2]|0?[1-9]):([0-5][0-9]) ?([AaPp][Mm]))" > /tmp/$i.out
t_rise="$(date --date="$(head -1 /tmp/$i.out)" +%R):00"
t_set="$(date --date="$(tail -1 /tmp/$i.out)" +%R):00"
rm /tmp/$i.out
if [ "$t_rise" == "00:00:00" ] || [ "$t_set" == "00:00:00" ]; then 
	echo "Invalid weather code."; exit
fi
if [ -z "$x" ]; then echo -e "Sunrise: $t_rise\nSunset: $t_set"; fi
if [ "$x" == "rise" ]; then 
	echo $t_rise
else if [ "$x" == "set" ]; then
	echo $t_set
fi fi
exit
