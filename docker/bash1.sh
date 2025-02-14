#!/bin/bash

# Construire l'image Docker
docker build -t my-nginx-image .

# Démarrer le conteneur
docker run -d -p 8080:80 --name my-nginx-container my-nginx-image

echo "Le conteneur Nginx est démarré et accessible sur http://localhost:8080"
