int row = 0;
int printf(const char* txt) {
    char *video_memory = (char*)0xb8000;
    int i = 0;
    int col = 0;

    while (txt[i] != '\0') {
        if (txt[i] == '\n') {
            row++;
            col = 0;
        } else {
            video_memory[(row * 80 + col) * 2] = txt[i];
            video_memory[(row * 80 + col) * 2 + 1] = 0x07;
            col++;
            if (col >= 80) {
                col = 0;
                row++;
            }
        }
        i++;
    }
}

void clear_screen() {
    char *video_memory = (char*)0xb8000;
    for (int i = 0; i < 80 * 25; i++) {
        video_memory[i * 2] = ' ';
        video_memory[i * 2 + 1] = 0x07;
    }
}


void kernel_main(void* ms, unsigned int mk) {
    clear_screen();
    printf("FomiZ Zash Terminal By Fom477 (Also Called FZTerminal)\n");
    printf("Running On FomiZ Kernel Version 0.1\n");
    printf("Copyright (c) 2021 FomixStudios\n");
    printf("All Right Reserved.\n");
    printf("WARNING!!! THIS VERSION IS ONLY A PRERELEASE, AND IT CAN ONLY PRINT 'Hello, world!' WITHOUT ANY FUNCTIONS\n\n\n\n\n");
    while (1)
    {
        printf("fomiz@zash > Hello, world!\n");
    }
}
