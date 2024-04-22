#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <math.h>

int isPrime(int num) {
    if (num <= 1) {
        return 0; 
    }
    for (int i = 2; i * i <= num; ++i) {
        if (num % i == 0) {
            return 0; 
        }
    }
    return 1;
}

void *printPrimes(void *arg) {
    int limit = *((int *)arg);
    for (int i = 2; i <= limit; ++i) {
        if (isPrime(i)) {
            printf("%d ", i);
        }
    }
    printf("\n");
    pthread_exit(NULL);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <limit>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    int limit = atoi(argv[1]);

    if (limit <= 1) {
        fprintf(stderr, "Please enter a positive integer greater than 1.\n");
        exit(EXIT_FAILURE);
    }

    pthread_t primeThread;

    if (pthread_create(&primeThread, NULL, printPrimes, (void *)&limit) != 0) {
        perror("pthread_create");
        exit(EXIT_FAILURE);
    }

    if (pthread_join(primeThread, NULL) != 0) {
        perror("pthread_join");
        exit(EXIT_FAILURE);
    }

    return 0;
}
