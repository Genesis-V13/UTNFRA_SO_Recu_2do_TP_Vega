#!/bin/bash

mkdir -p /tmp/Animales/Agua
mkdir -p /tmp/Animales/Tierra/Mamiferos
mkdir -p /tmp/Animales/Tierra/Oviparos

> /tmp/animales.txt

while IFS=' ' read -r animal habitat || [ -n "$animal" ]
do
    [ -z "$animal" ] && continue
[[ "$animal" =~ ^# ]] && continue
[ -z "$habitat" ] && continue

    echo "20241119 - Animal: $animal - Habitat: $habitat" >> /tmp/animales.txt

    case "$habitat" in
        AG)
            echo "20241119 - Animal: $animal - Habitat: $habitat" > /tmp/Animales/Agua/$animal.txt
            ;;
        TM)
            echo "20241119 - Animal: $animal - Habitat: $habitat" > /tmp/Animales/Tierra/Mamiferos/$animal.txt
            ;;
        TO)
            echo "20241119 - Animal: $animal - Habitat: $habitat" > /tmp/Animales/Tierra/Oviparos/$animal.txt
            ;;
    esac
done < "$1"