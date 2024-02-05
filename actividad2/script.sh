#!/bin/bash

# Leer la variable GITHUB_USER
echo "Introduzca su nombre de usuario de Github: "
read GITHUB_USER

# Consultar la URL de la API de Github
API_URL="https://api.github.com/users/$GITHUB_USER"
JSON_DATA=$(curl -s $API_URL)

# Extraer datos del JSON
ID=$(echo $JSON_DATA | jq -r '.id')
CREATED_AT=$(echo $JSON_DATA | jq -r '.created_at')

# Imprimir mensaje
echo "Hola $GITHUB_USER. User ID: $ID. Cuenta fue creada el: $CREATED_AT."

# Generar fecha actual
FECHA=$(date +"%Y-%m-%d")

# Crear archivo de log
LOG_FILE="/tmp/$FECHA/saludos.log"
echo "Hola $GITHUB_USER. User ID: $ID. Cuenta fue creada el: $CREATED_AT." >> $LOG_FILE

# Crear cronjob
echo "*/5 * * * * $0 >> $LOG_FILE 2>&1" | crontab -u $USER

echo "**Script ejecutado con éxito.**"
echo "**Se ha creado un archivo de log en $LOG_FILE**"
echo "**Se ha creado un cronjob para ejecutar el script cada 5 minutos**"

