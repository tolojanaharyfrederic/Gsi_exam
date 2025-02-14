# Utiliser une image de base Ubuntu
FROM ubuntu:latest

# Mettre à jour les paquets et installer Nginx
RUN apt-get update && apt-get install -y nginx

# Copier le fichier HTML dans le conteneur
RUN echo "<html><body><h1>Hello, World!</h1></body></html>" > /var/www/html/index.html

# Exposer le port 80
EXPOSE 80

# Démarrer Nginx
CMD ["nginx", "-g", "daemon off;"]
