# sol ☀️
display sunrise & sunset directly to STDOUT.

# example
```
[draumaz@linux ~]$ sol 70195
Sunrise: 06:56:00
Sunset: 17:14:00
```

# usage
```sol 00544``` - display sunrise and sunset for weather code 00544

```sol 70195 rise``` - retrieve 24hr encoded 00:00:00 sunrise timestring

```sol 90016 set``` - retrieve 24hr encoded 00:00:00 sunset timestring

# dependencies
curl

# install
```
git clone https://github.com/draumaz/sol; cd sol
mv sol.sh sol && chmod +x sol; mv sol /somewhere/in/your/path/
```
