CC = arm-none-eabi-gcc
OBJCOPY = arm-none-eabi-objcopy
CFLAGS = -mcpu=cortex-m3 -mthumb -nostdlib -O0
LDFLAGS = -T stm32.ld

all: main.bin

main.elf: main.c startup.c
	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o main.elf

main.bin: main.elf
	$(OBJCOPY) -O binary $< $@

flash: main.bin
	st-flash write $< 0x08000000	

clean:
	rm -f *.elf *.bin

.PHONY: all clean flash
