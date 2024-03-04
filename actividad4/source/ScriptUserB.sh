#!/bin/bash

pipe_from_a="userA"
pipe_to_b="userB"

trap "rm -f $pipe_to_b" EXIT

if [[ ! -p $pipe_from_a ]]; then
    echo "Error: El pipe desde el primer participante no existe."
    exit 1
fi

while true; do
    read -p "Tú: " message
    echo "$message" > $pipe_from_a
done
