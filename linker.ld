OUTPUT_FORMAT("elf32-i386")
ENTRY(loader)

MEMORY {
    RAM (rwx) : ORIGIN = 0x100000, LENGTH = 0x400000
}

SECTIONS {
    . = ORIGIN(RAM);

    .multiboot : {
        KEEP(*(.multiboot))
    }

    .text : {
        *(.text)
    } > RAM

    .rodata : {
        *(.rodata)
    } > RAM

    .data : {
        *(.data)
    } > RAM

    .bss : {
        *(.bss)
    } > RAM
}
