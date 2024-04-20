#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <stdbool.h>

int main() {
    fork();
    fork();
    fork();
    printf("Child pid: %d, Parent's pid: %d\n", getpid(), getppid());

    return 0;
}