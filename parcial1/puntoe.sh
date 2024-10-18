#!/bin/bash

PATH_PARCIAL="/home/vagrant/AySO-Parcial1-ConstanzaSalamone/parcial1"

OUTPUT_FILE="$PATH_PARCIAL/Filtro_Basico.txt"

touch "$OUTPUT_FILE"

# Extraer información de memoria RAM y del fabricante del chasis
grep MemTotal /proc/meminfo > "$OUTPUT_FILE"

echo -e "\nChassis Information:" >> "$OUTPUT_FILE"

sudo dmidecode -t chassis | grep "Manufacturer" >> "$OUTPUT_FILE"

# Confirmación
echo "Información filtrada y guardada en $OUTPUT_FILE"

