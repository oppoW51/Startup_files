MEMORY
{
    FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 64K // check your memory
    RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 20K
}

_estack = ORIGIN(RAM) + LENGTH(RAM); // steck start at the end of RAM

SECTIONS
{
    // init vector table at the start of the flash
    .vectors : {
        . = ALIGN(4);
        KEEP(*(.vectors))
    } > FLASH

    // code
    .text : {
        . = ALIGN(4);
        *(.text*)
        *(.rodata*)
        . = ALIGN(4);
    } > FLASH
    
    // initialized variables
    .data : {
        . = ALIGN(4);
        _sdata = .;
        *(.data*)
        _edata = .;
    } > RAM AT > FLASH
    
    _sidata = LOADADDR(.data);
    
    // not initialized variables
    .bss : {
        . = ALIGN(4);
        _sbss = .;
        *(.bss*)
        *(COMMON)
        . = ALIGN(4);
        _ebss = .;
    } > RAM
}
