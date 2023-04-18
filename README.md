# SuperSSH
Application web ( Python/Flask )
contributeur: [WalidA2D](https://github.com/WalidA2D), [FeitvnX](https://github.com/FeitvnX),

**SuperSSH** est une application web qui permet de lancer une liste de commandes predefinis par un utilisateur sur plusieurs machines, 
depuis le reseaux avec le protocole ssh, à l'aide de fichier contenants les adresses IPs et les commandes.

L'application tourne sur python avec le framework [Flask](https://flask.palletsprojects.com/en/2.2.x/)
et utilise la libraire python [paramiko](https://www.paramiko.org/) pour les connections ssh.

## Installation de l'application
```bash
apt install python3 python3-pip mariadb-server
```
```bash
pip install flask mysql.connector paramiko
```
