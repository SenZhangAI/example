// gcc -fno-stack-protector -z execstack -o stackoverflow stackoverflow.c

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void vulnerable_function() {
    char buf[128];
    read(STDIN_FILENO, buf, 256);
}

int main(int argc, char *argv[])
{
    vulnerable_function();
    write(STDOUT_FILENO, "Hello World\n", 13);
    return 0;
}
