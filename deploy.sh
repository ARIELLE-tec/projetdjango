#!/bin/bash

# Script de déploiement pour Django sur EC2

# Variables d'environnement
export DJANGO_SETTINGS_MODULE=projetdjango.settings
export DJANGO_SECRET_KEY=$DJANGO_SECRET_KEY
export DEBUG=$DEBUG
export ALLOWED_HOSTS=$ALLOWED_HOSTS

# Chemin du projet
PROJECT_DIR="/home/ubuntu/projetdjango"
VENV_DIR="$PROJECT_DIR/venv"

# Activer l'environnement virtuel
source $VENV_DIR/bin/activate

# Aller dans le répertoire du projet
cd $PROJECT_DIR

# Installer les dépendances
pip install -r requirements.txt

# Appliquer les migrations
python manage.py migrate

# Collecter les fichiers statiques
python manage.py collectstatic --noinput

# Redémarrer gunicorn
sudo systemctl restart gunicorn

# Désactiver le site par défaut de nginx
sudo unlink /etc/nginx/sites-enabled/default

# Activer le site projetdjango
sudo ln -s /etc/nginx/sites-available/projetdjango /etc/nginx/sites-enabled

# Tester la configuration nginx
sudo nginx -t

# Redémarrer nginx
sudo systemctl reload nginx

echo "Déploiement terminé avec succès"
