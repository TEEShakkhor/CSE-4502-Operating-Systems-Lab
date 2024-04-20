#include <stdio.h>
#include <stdlib.h>
#include <sys/ipc.h>
#include <sys/shm.h>

#define SHM_SIZE 1024

void bubbleSort(int arr[], int n) {
    int temp;
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                
                temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
}

int main() {
    int shmid;
    key_t key = ftok("server.c", 1);

    
    shmid = shmget(key, SHM_SIZE, IPC_CREAT | 0666);
    if (shmid == -1) {
        perror("shmget");
        exit(EXIT_FAILURE);
    }

    
    int *arr = (int *)shmat(shmid, NULL, 0);
    if (arr == (int *)(-1)) {
        perror("shmat");
        exit(EXIT_FAILURE);
    }

    printf("Enter 5 random integers:\n");
    for (int i = 0; i < 5; i++) {
        scanf("%d", &arr[i]);
    }

    bubbleSort(arr, 5);

    
    shmdt(arr);

    printf("Array sorted and stored in shared memory.\n");

    return 0;
}

