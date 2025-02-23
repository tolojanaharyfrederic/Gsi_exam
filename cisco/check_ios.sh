#!/bin/bash

# Créer le dossier ios_configs s'il n'existe pas
mkdir -p ios_configs

# Créer running_config101
echo "hostname Router101" > ios_configs/running_config101
echo "version csr1000v-universalk9.17.03.04" >> ios_configs/running_config101

# Créer running_config111
echo "hostname Router111" > ios_configs/running_config111
echo "version csr1000v-universalk9.17.03.05" >> ios_configs/running_config111

echo "Fichiers de configuration créés dans ios_configs/"
