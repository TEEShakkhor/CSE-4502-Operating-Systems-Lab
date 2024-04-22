#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <math.h>
#define MAX_TERMS 100

unsigned long long fibonacciSequence[MAX_TERMS];

struct ThreadParams {
    int numTerms;
};

void *generateFibonacci(void *arg) {
    struct ThreadParams *params = (struct ThreadParams *)arg;
    int numTerms = params->numTerms;

    fibonacciSequence[0] = 0;
    fibonacciSequence[1] = 1;

    for (int i = 2; i < numTerms; i++) {
        fibonacciSequence[i] = fibonacciSequence[i - 1] + fibonacciSequence[i - 2];
    }

    pthread_exit(NULL);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <number_of_fibonacci_numbers>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    int numTerms = atoi(argv[1]);

    if (numTerms <= 0 || numTerms > MAX_TERMS) {
        fprintf(stderr, "Please enter a positive integer up to %d.\n", MAX_TERMS);
        exit(EXIT_FAILURE);
    }

    pthread_t fibonacciThread;
    struct ThreadParams threadParams = {numTerms};

    if (pthread_create(&fibonacciThread, NULL, generateFibonacci, (void *)&threadParams) != 0) {
        perror("pthread_create");
        exit(EXIT_FAILURE);
    }

    if (pthread_join(fibonacciThread, NULL) != 0) {
        perror("pthread_join");
        exit(EXIT_FAILURE);
    }

    printf("Generated Fibonacci sequence:\n");
    for (int i = 0; i < numTerms; i++) {
        printf("%llu ", fibonacciSequence[i]);
    }
    printf("\n");

    return 0;
}
