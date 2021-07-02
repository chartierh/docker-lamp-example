# Projet Docker Stack LAMP

Créer un docker-compose qui déploie 3 containers :

  * PHP
  * Web
  * Base de données

## Utilisation

### Cloner le dépôt :

<code>git clone https://gitlab.com/toutainj/docker-lamp-exemple.git</code>

### Copier les fichiers sample.*.env et les éditer avec les variables souhaitées

<code>cp sample.db.env db.env && cp sample.web.env web.env</code>

### Lancer les containers :

<code>cd docker-lamp-exemple/ && docker-compose up -d</code>
