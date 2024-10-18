#!/bin/bash

# Declaro la variable con la ruta base
BASE_PATH="/home/vagrant/AySO-Parcial1-ConstanzaSalamone/parcial1/Examenes-UTN"
BASE_PATH_PARCIAL="/home/vagrant/AySO-Parcial1-ConstanzaSalamone/parcial1"

# Creo grupos
sudo groupadd grupoprogramadores
sudo groupadd grupotester
sudo groupadd grupoanalistas
sudo groupadd grupodisenadores

# Agrego usuarios a los grupos
sudo useradd -m -G grupoprogramadores programadores
sudo useradd -m -G grupotester tester
sudo useradd -m -G grupoanalistas analistas
sudo useradd -m -G grupodisenadores disenadores

# Asigno permisos
sudo chown programadores:programadores "$BASE_PATH/alumno_1"
sudo chmod 750 "$BASE_PATH/alumno_1"

sudo chown tester:tester "$BASE_PATH/alumno_2"
sudo chmod 760 "$BASE_PATH/alumno_2"

sudo chown analistas:analistas "$BASE_PATH/alumno_3"
sudo chmod 700 "$BASE_PATH/alumno_3"

sudo chown disenadores:disenadores "$BASE_PATH/profesores"
sudo chmod 775 "$BASE_PATH/profesores"

# validar.txt

#sudo -u programadores bash -c "whoami > $BASE_PATH/alumno_1/validar.txt"
#sudo -u tester bash -c "whoami > $BASE_PATH/alumno_2/validar.txt"
#sudo -u analistas bash -c "whoami > $BASE_PATH/alumno_3/validar.txt"
#sudo -u disenadores bash -c "whoami > $BASE_PATH/profesores/validar.txt"

# Carpeta en caso que haya problemas
#sudo -u programadores bash -c "whoami > /home/parcial1/validar.txt"


declare -A users=(
    ["programadores"]="$BASE_PATH/alumno_1/validar.txt"
    ["tester"]="/home/vagrant/AySO-Parcial1-ConstanzaSalamone/parcial1/Examenes-UTN/alumno_2/validar.txt"
    ["analistas"]="/home/vagrant/AySO-Parcial1-ConstanzaSalamone/parcial1/Examenes-UTN/alumno_3/validar.txt"
    ["disenadores"]="/home/vagrant/AySO-Parcial1-ConstanzaSalamone/parcial1/Examenes-UTN/profesores/validar.txt"
)

for user in "${!users[@]}"; do
    sudo -u "$user" bash -c "whoami > ${users[$user]} || echo 'Error de permisos con $user, creando en parcial1/validar.txt' && whoami > $BASE_PATH_PARCIAL/validar.txt"
done
