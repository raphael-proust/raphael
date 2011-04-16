
all:
	make -C src
	make -C test
	make -C examples


clean:
	make -C src clean
	make -C test clean
	make -C examples clean

