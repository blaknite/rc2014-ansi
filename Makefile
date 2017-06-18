all: rc2014.o

rc2014.o: rc2014.asm
	zcc +embedded -vn -SO3 -m -startup=0 -clib=new -c rc2014.c

.PHONY clean:
	rm -f *.bin *.lst *.obj *.lib *.lis
