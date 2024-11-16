AS := as
CC := gcc
CP := cp
GB := grub-mkrescue
LD := ld

OBJS := loader.o kernel.o
TARGET := kernel.bin
TARGET_ISO := kernel.iso
TARGET_PT := iso/boot

CFLAGS := -m32 -nostdlib -fno-builtin
LDFLAGS := -melf_i386 -T linker.ld

all: $(TARGET)

$(TARGET): $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $^
	$(CP) $(TARGET) $(TARGET_PT)
	$(GB) -o $(TARGET_ISO) iso/

%.o: %.S
	$(AS) -m32 -c loader.S -o loader.o 
%.o: %.c
	$(CC) $(CFLAGS) -c kernel.c -o kernel.o

clean:
	rm -f $(OBJS) $(TARGET) $(TARGET_ISO) iso/boot/$(TARGET)

.PHONY: all clean

qemu:
	qemu-system-i386 -cdrom $(TARGET_ISO) -boot d 