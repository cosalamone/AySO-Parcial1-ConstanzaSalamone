#!/bin/bash

PATH_PARCIAL="/home/vagrant/AySO-Parcial1-ConstanzaSalamone/parcial1"

mkdir -p $PATH_PARCIAL/Estructura_Asimetrica/{correo/{cartas_{1..50},carteros_{1..10}},clientes/cartas_{1..50}}

echo "se creó la estructura asimetrica"

tree $PATH_PARCIAL/Estructura_Asimetrica


