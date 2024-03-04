# Actividad 4 - Chat Básico utilizando Named Pipes y Bash en Linux

Este es un chat básico que permite la comunicación entre dos participantes utilizando Named Pipes en Linux y scripts de Bash.

## Descripción

El chat se compone de dos scripts de Bash, uno para cada participante (Usuario A y Usuario B), que se comunican a través de dos Named Pipes. Cada usuario tiene su propio script y su propio Named Pipe para enviar y recibir mensajes.

## Codigo Utilizado

### Codigo para el chat del usuario 1

![alt text](image-8.png)

### Codigo para el chat del usuario 2

![alt text](image-9.png)

## Proceso

1. **Crear Named Pipe para Usuario A:** 
   
   ![Named Pipe para Usuario A](image.png)

2. **Crear Named Pipe para Usuario B:** 
   
   ![Named Pipe para Usuario B](image-1.png)

3. **Conceder permisos a los scripts:**
   
   - **ScriptUserA.sh:**
     
     ![Permisos para ScriptUserA.sh](image-4.png)
   
   - **ScriptUserB.sh:**
     
     ![Permisos para ScriptUserB.sh](image-5.png)

## Ejecución

1. **Usuario A:**
   
   - Ejecutar el archivo `ScriptUserA.sh`
     
     ![Ejecutar ScriptUserA.sh](image-6.png)

2. **Usuario B:**
   
   - Ejecutar el archivo `ScriptUserB.sh`
     
     ![Ejecutar ScriptUserB.sh](image-7.png)

