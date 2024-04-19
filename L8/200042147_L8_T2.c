#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int main() {
    int variable = 0;
    int studentID = 200042147;

    pid_t child_pid = fork();

    if (child_pid < 0) {
        perror("Fork failed");
        return 1;
    } else if (child_pid == 0) {
        //child process
        variable += studentID;
        printf("Child Process: Variable = %d\n", variable);
    } else {
        //parent process
        variable += studentID % 1000;
        printf("Parent Process: Variable = %d\n", variable);
    }

    return 0;
}

