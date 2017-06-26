all: rc2014_ansi

rc2014_uart:
	$(MAKE) -C ../rc2014-uart/

rc2014_ansi: rc2014_uart
	zcc +embedded -vn -O3 -m -startup=0 -clib=new -L../rc2014-uart/ -I../rc2014-uart/ -lrc2014_uart.lib -o rc2014_ansi -x rc2014_ansi.c

.PHONY clean:
	rm -f *.bin *.lst *.obj *.lib *.lis
