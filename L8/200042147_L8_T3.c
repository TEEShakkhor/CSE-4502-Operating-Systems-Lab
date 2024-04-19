#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

void Fibonacci(int n) {
    int a = 0, b = 1;
    printf("Fibonacci Sequence: ");
    
    for (int i = 0; i < n; i++) {
        printf("%d ", a);
        int next = a + b;
        a = b;
        b = next;
    }
    printf("\n");
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <non-negative number>\n", argv[0]);
        return 1;
    }

    int n = atoi(argv[1]);

    if (n < 0) {
        fprintf(stderr, "Input must be a non-negative number.\n");
        return 1;
    }

    pid_t child_pid = fork();

    if (child_pid < 0) {
        perror("Fork failed");
        return 1;
    } else if (child_pid == 0) {
        //child process
        Fibonacci(n);
    } else {
        //parent process
        wait(NULL);
    }

    return 0;
}