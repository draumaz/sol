main: sol
	cp ./sol.sh ./sol
	chmod a+x ./sol

clean: sol
	rm ./sol

install: sol
	cp ./sol /usr/local/bin/sol
