#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <math.h>

#define M 3 
#define K 2 
#define N 1 

int A[M][K]; 
int B[K][N]; 
int C[M][N]; 


struct ThreadParams {
    int row; 
    int col;
};


void *multiply(void *param) {
    struct ThreadParams *params = (struct ThreadParams *)param;
    int row = params->row;
    int col = params->col;

    C[row][col] = 0;
    for (int i = 0; i < K; i++) {
        C[row][col] += A[row][i] * B[i][col];
    }

    pthread_exit(NULL);
}

int main() {
printf("Enter values for Matrix A (%d x %d):\n", M, K);
    for (int i = 0; i < M; i++) {
        for (int j = 0; j < K; j++) {
            printf("A[%d][%d]: ", i, j);
            scanf("%d", &A[i][j]);
        }
    }

    printf("Enter values for Matrix B (%d x %d):\n", K, N);
    for (int i = 0; i < K; i++) {
        for (int j = 0; j < N; j++) {
            printf("B[%d][%d]: ", i, j);
            scanf("%d", &B[i][j]);
        }
    }

    pthread_t threads[M][N];
    struct ThreadParams params[M][N];

    for (int i = 0; i < M; i++) {
        for (int j = 0; j < N; j++) {
            params[i][j].row = i;
            params[i][j].col = j;
            pthread_create(&threads[i][j], NULL, multiply, &params[i][j]);
        }
    }

    for (int i = 0; i < M; i++) {
        for (int j = 0; j < N; j++) {
            pthread_join(threads[i][j], NULL);
        }
    }

    printf("Result Matrix C:\n");
    for (int i = 0; i < M; i++) {
        for (int j = 0; j < N; j++) {
            printf("%d ", C[i][j]);
        }
        printf("\n");
    }

    return 0;
}
