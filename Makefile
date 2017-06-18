all: rc2014.lib

rc2014.lib:
	zcc +embedded -vn -SO3 -m -startup=0 -clib=new -o rc2014 -x rc2014.c rc2014.asm

.PHONY clean:
	rm -f *.bin *.lst *.obj *.lib *.lis
