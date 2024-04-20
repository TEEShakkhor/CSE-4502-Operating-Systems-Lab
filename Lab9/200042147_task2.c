#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <string.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#define SHM_SIZE 1024

void fibonacci(int numofTerms, int arr[]) {
    if (numofTerms <= 0) {
        fprintf(stderr, "Invalid number of terms\n");
        exit(EXIT_FAILURE);
    }

    arr[0] = 0;

    if (numofTerms > 1) {
        arr[1] = 1;

        for (int i = 2; i < numofTerms; ++i) {
            arr[i] = arr[i - 1] + arr[i - 2];
        }
    }
}


int main(int argc, char *argv[])
{

    if (argc != 2) {
        printf("Usage: %s <n>\n", argv[0]);
        return 1;
    }

    int shmid = shmget(IPC_PRIVATE,SHM_SIZE,0666|IPC_CREAT);
    int *str = (int*) shmat(shmid,NULL,0);
    
	pid_t pid1;
    pid1 = fork();
    int n = 0;
    if (pid1 < 0)
    {
		printf("Fork failed");
	}
	else if (pid1 == 0)
	{
        printf("I am a child\n");
        n = atoi(argv[1]);
        printf("The varibale input is %d\n", n);
        fibonacci(n,str);
        printf("Fibonacci Generation completed. Sequence stored in shared memory.\n");
        shmdt(str);

    }
    else if( pid1 > 0)
    {
        printf("I am a parent\n");
        printf("I am waiting for the child to complete\n");
        wait(NULL);
        printf("The child process is complete!\nI am done waiting\n");
        for(int i=0;i<atoi(argv[1]);i++){
            printf("%d ",str[i]);
        }
        printf("\n");
        shmdt(str);
        shmctl(shmid,IPC_RMID,NULL);
    }
    return 0;
}