#!/bin/bash

# Définir les informations de connexion SSH
ROUTER_IP="192.168.134.144"
SSH_USER="cisco"
SSH_PASSWORD="cisco123!"

# Définir le fichier de sortie
OUTPUT_FILE="check_ios.rep"

# Vider le fichier de sortie s'il existe déjà
> "$OUTPUT_FILE"

# Écrire la date du jour dans le fichier de sortie
echo "$(date)" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Écrire le message de début de vérification
echo "STARTING IOS CHECK" >> "$OUTPUT_FILE"

# Se connecter au routeur via SSH et exécuter les commandes
sshpass -p "$SSH_PASSWORD" ssh -o StrictHostKeyChecking=no "$SSH_USER@$ROUTER_IP" <<EOF > temp_output.txt
show version | include Cisco IOS XE Software
show running-config | include hostname
exit
EOF

# Extraire les informations du fichier temporaire
ios_version=$(grep "Cisco IOS XE Software" temp_output.txt | awk '{print $6}')
hostname=$(grep "hostname" temp_output.txt | awk '{print $2}')

# Vérifier si la version IOS est à jour
if [[ "$ios_version" == "17.03.05" ]]; then
    upgrade_message="iOS is up to date."
else
    upgrade_message="iOS needs to be upgraded."
fi

# Écrire les informations dans le fichier de sortie
echo "Hostname: $hostname" >> "$OUTPUT_FILE"
echo "IOS Version: $ios_version" >> "$OUTPUT_FILE"
echo "$upgrade_message" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Supprimer le fichier temporaire
rm temp_output.txt

echo "IOS check completed. Report generated in $OUTPUT_FILE"
