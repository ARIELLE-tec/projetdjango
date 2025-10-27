# TODO: Déploiement Django sur AWS EC2 avec CI/CD

## Étape 1: Préparation du projet pour la production
- [x] Modifier projetdjango/settings.py : Désactiver DEBUG, définir ALLOWED_HOSTS, utiliser variables d'environnement pour SECRET_KEY.
- [x] Mettre à jour requirements.txt : Ajouter gunicorn et autres dépendances nécessaires.
- [x] Créer un script deploy.sh pour automatiser les migrations, collectstatic, etc.

## Étape 2: Configuration de l'instance EC2
- [ ] Installer Python, pip, virtualenv, nginx, gunicorn sur EC2.
- [ ] Configurer nginx pour servir l'application Django.
- [ ] Configurer les groupes de sécurité (ports 22, 80).
- [ ] Générer et configurer les clés SSH pour GitHub Actions.

## Étape 3: Pipeline CI/CD avec GitHub Actions
- [x] Créer .github/workflows/deploy.yml pour automatiser le déploiement sur push vers main.
- [x] Tester le workflow localement si possible.

## Étape 4: Déploiement initial
- [ ] Pousser les changements sur GitHub pour déclencher le déploiement.
- [ ] Vérifier que le site fonctionne sur EC2.
- [ ] Surveiller les logs pour les erreurs.

## Étape 5: Tests et validation
- [ ] Tester l'application déployée.
- [ ] Effectuer des tests de charge si nécessaire.
