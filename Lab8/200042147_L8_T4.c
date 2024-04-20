#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main(int argc, char *argv[]) 
{
    if (argc < 2) 
    {
        printf("Invalid arguments");
        return 1;
    }

    pid_t pid = fork();

    if (pid < 0) 
    {
        printf("Fork failed\n");
        return 1;
    } 
    else if (pid == 0) 
    {
        printf("Hi, I am a Child Process\n");
        exit(0);
    } 
    else 
    {
        wait(NULL);

        if (argc > 1) 
        {
            if (execvp(argv[1], &argv[1]) == -1) 
            {
                printf("Exec failed");
                return 1;
            }
        }
    }

    return 0;
}
