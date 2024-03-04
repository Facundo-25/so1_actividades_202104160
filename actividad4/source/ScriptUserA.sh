#!/bin/bash

pipe_from_b="userB"
pipe_to_a="userA"

trap "rm -f $pipe_to_a" EXIT

if [[ ! -p $pipe_from_b ]]; then
    echo "Error: El pipe desde el segundo participante no existe."
    exit 1
fi

while true; do
    if read message <$pipe_from_b; then
        echo "Participante 2: $message"
    fi
done
