#!/bin/sh
# draumaz/sol, 2022
# MIT

case "$1" in
  "") echo -n "Weather code: " && read i ;;
  *) i="$1" ;;
esac

curl --silent https://weather.com/weather/today/l/$i | \
  grep SunriseSunset | \
  grep -oE "((1[0-2]|0?[1-9]):([0-5][0-9]) ?([AaPp][Mm]))" \
> /tmp/$i.out

t_rise=`date --date="$(head -1 /tmp/$i.out)" +%R`:00
t_set=`date --date="$(tail -1 /tmp/$i.out)" +%R`:00

rm /tmp/$i.out

for i in "$t_rise" "$t_set"; do
  case "$i" in "00:00:00") echo "Invalid weather code." && exit ;; esac
done

case "$2" in 
  "rise") echo $t_rise ;; 
  "set") echo $t_set ;; 
  *) echo "Sunrise: $t_rise"; echo "Sunset: $t_set" ;; 
esac
