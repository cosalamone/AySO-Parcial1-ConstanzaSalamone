#!/bin/bash

PATH_PARCIAL="/home/vagrant/AySO-Parcial1-ConstanzaSalamone/parcial1"
OUTPUT_FILE="$PATH_PARCIAL/Filtro_Avanzado.txt"

touch "$OUTPUT_FILE"

IP_PUBLICA=$(curl -s ifconfig.me)

USUARIO=$(whoami)

HASH_USUARIO=$(grep "^$USUARIO:" /etc/shadow | cut -d: -f2)


echo "Mi IP pública es: $IP_PUBLICA" > "$OUTPUT_FILE"
echo "Mi usuario es: $USUARIO" >> "$OUTPUT_FILE"
echo "El Hash de mi usuario es: $HASH_USUARIO" >> "$OUTPUT_FILE"

echo "Se filtró y guado la informacion en $OUTPUT_FILE"

