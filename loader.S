.set MK, 0x1badb002
.set FG, (1<<0 | 1<<1)
.set CHECKSUM, -(MK + FG)

.section .note.GNU-stack,"",@progbits

.section .multiboot
    .long MK
    .long FG
    .long CHECKSUM

.section .text
.extern kernel_main
.global loader

loader:
    mov $kernel_stack, %esp
    call kernel_main

_stop:
    cli
    hlt
    jmp _stop

.section .bss
.space 2*1024*1024
kernel_stack:
