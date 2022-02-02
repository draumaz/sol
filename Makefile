make: sol
	cp -v ./sol.sh ./sol
	chmod -v a+x ./sol

install: sol
	cp -v ./sol /usr/local/bin/sol

clean: sol
	rm -v ./sol
