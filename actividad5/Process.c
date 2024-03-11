#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

// Función que será ejecutada por el hilo creado
void* thread_function(void *arg) {
    printf("Hilo creado en proceso: %d, ID del hilo: %lu\n", getpid(), pthread_self());
    return NULL;
}

int main() {
    pid_t pid;

    // Imprime el PID (ID de proceso) del proceso principal
    printf("Proceso inicial PID: %d\n", getpid());

    // Crea un nuevo proceso hijo
    pid = fork();
    if (pid == 0) { // Si es el proceso hijo
        // Imprime el PID del proceso hijo y el PID de su padre
        printf("Proceso hijo PID: %d, PID del padre: %d\n", getpid(), getppid());

        // Crea un nuevo proceso hijo (proceso nieto)
        pid_t child_pid = fork();
        if (child_pid == 0) { // Si es el proceso nieto
            // Imprime el PID del proceso nieto y el PID de su padre
            printf("Proceso nieto PID: %d, PID del padre: %d\n", getpid(), getppid());
        }

        // Crea un nuevo hilo en el proceso hijo o en el proceso nieto
        pthread_t thread_id;
        pthread_create(&thread_id, NULL, thread_function, NULL);
    }

    // El proceso padre original, el primer hijo y el nieto pasan por aquí
    // Se creará un nuevo proceso hijo
    pid = fork();
    if (pid == 0) { // Si es el nuevo proceso hijo
        // Imprime el PID del nuevo proceso hijo y el PID de su padre
        printf("Nuevo proceso hijo PID: %d, PID del padre: %d\n", getpid(), getppid());
    }

    return 0;
}
