CFLAGS=-m32 -fno-stack-protector
ASFLAGS=-f elf32
LDFLAGS=-m elf_i386

CC=gcc
AS=nasm
LD=ld

all: kernel

kernel: kasm.o kc.o link.ld
	$(LD) $(LDFLAGS) -o kernel kasm.o kc.o -T link.ld

kasm.o: kernel.asm
	$(AS) $(ASFLAGS) kernel.asm -o kasm.o

kc.o: kernel.c
	$(CC) $(CFLAGS) -c kernel.c -o kc.o

clean:
	rm -f kernel vimOS.iso *.o
