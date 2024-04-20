#include <stdio.h>
#include <stdlib.h>
#include <sys/ipc.h>
#include <sys/shm.h>

#define SHM_SIZE 1024

int binarySearch(int arr[], int low, int high, int key) {
    while (low <= high) {
        int mid = low + (high - low) / 2;

        if (arr[mid] == key)
            return mid;

        if (arr[mid] < key)
            low = mid + 1;
        else
            high = mid - 1;
    }

    return -1; 
}

int main() {
    int shmid;
    key_t key = ftok("server.c", 1);

    
    shmid = shmget(key, SHM_SIZE, 0666);
    if (shmid == -1) {
        perror("shmget");
        exit(EXIT_FAILURE);
    }

    int *arr = (int *)shmat(shmid, NULL, 0);
    if (arr == (int *)(-1)) {
        perror("shmat");
        exit(EXIT_FAILURE);
    }

    int keyToSearch;
    printf("Enter the value to search: ");
    scanf("%d", &keyToSearch);

    int result = binarySearch(arr, 0, 4, keyToSearch);

    if (result != -1) {
        printf("Value %d found at index %d.\n", keyToSearch, result);
    } else {
        printf("Value %d not found.\n", keyToSearch);
    }

    shmdt(arr);

    return 0;
}

