# Bienvenue sur le projet Qulbutoquiz

mee
## Qu'est ce que Qulbutoquiz ?
Ce projet est un site web où l'utilisateur peut répondre à des quiz sur le thème extrêmement vaste que sont les jeux pokémon pour tester sa culture à ce sujet.
## Pourquoi avoir développer ce site Web ?
J'ai développer ce site Web dans le cadre d'un test de technicité sur le langage, Ruby on Rails demandé par la société StudyCall. 
## Pourquoi avoir développer avec Ruby on Rails (RoR) ?
J'avais le choix du langage de programmation même si le faire en Ruby étais fortement conseiller. J'aurais pu le programmer dans des langages que je connaissais et que je maitrisais mieux comme React JS ou Symfony mais je voulais découvrir ce langage donc je me suis lancé dans la découverte de Ruby on Rails. A ma grande surprise, Ruby fut très facile à apprendre avec mes connaissances en C et python, je ne fut pas défamiliarisé.
L'enjeu était Rails qui est un framework pour le développement web avec de nombreuses ressources à mettre en place : les models , les views , les controllers ...
Malgré tout, j'ai pu m'y retrouvé avec mes bases en Symfony et j'ai apprécié utilisé RoR . 

Maintenant que vous en savez plus sur le projet et moi, passons à la mise en place du projet pour le tester localement.
#  Logiciel pré-réquis 
 Il y a 3 logiciels à installer : 
 - [ ] Ruby 2.7.0 **-le language de programmation-**
 - [ ] Ruby on Rails 7.0.2**-le framework-**
 - [ ] WAMP, LAMP ou MAMP **-le gestionnaire de BDD-** (en fonction de votre OS)
 
<!-- 
- ##  Installation sur Windows
### Commencant par le principal : <b>Ruby</b> :gem:
J'ai personnellement utiliser la version [3.1.2-1 ](https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-3.1.2-1/rubyinstaller-devkit-3.1.2-1-x64.exe) pour système 64 bits.
> Si vous souhaiter utiliser une autre version sans Dev-kit ou ultérieur, vous pourrez les trouver sur la [page officiel de téléchargement de Ruby](https://rubyinstaller.org/downloads/).

Lorsque l'installation est fini, cocher la case pour installer également MYSYS2 qui nous sera utile plus tard pour les gems.

    Appuyer sur `Entrer` dans le terminal MYSYS2 pour lancer l'installation

Une fois l'installation fini, vérifier si Ruby est bien installer grâce à la commande suivant à rentrant dans le CMD ou PowerShell

    ruby -v
Si ruby est bien installé voici le type de résultat  que vous devez obtenir

    ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [x64-mingw-ucrt]
Une fois la vérification faite on peut désormais installer rails via les gems de ruby 

    gem install rails

`Pour vérifier l'installation de rails utiliser la commande suivante

    rails -v
Rails est aujourd'hui à la version 7, nous devons obtenir ceci 

	Rails 7.0.3.1

___
### Passons maintenant a : <b>MAMP </b>:elephant:

Comme pour Ruby, sur windows nous avons un installer déja prêt pour la trinité.
J'utilise la version [5.0.5 ](https://downloads.mamp.info/MAMP-PRO-WINDOWS/releases/5.0.5/MAMP_MAMP_PRO_5.0.5.exe) pour windows.

> Libre à vous d'utiliser une autre version que vous pouvez récupérer
> sur le site offciel de [MAMP](https://www.mamp.info/en/downloads/).

Lancer l'installer 

> Vous pouvez décocher l'option Apple Bonjour


 BRAVO ! :smile: Vous avez fini l'installation de tous les logiciels . Passons maintenant à leurs configurations pour le bon déroulement de la suite. 

 # Mise en place
 ### Lancement du serveur MAMP</b>:elephant:
 
Avant de lancer le site, il va falloir préparer la base de donnée MySQL pour RoR.

Commencer par lancer MAMP, cocher la case Apache Server dans la fenêtre puis Open WebStartPage
> ![MAMP_launch](https://kinsta.com/wp-content/uploads/2021/04/mamp-window.jpg)
> 
Vous arriverez sur une fenêtre aller dans Tools > PHPMYADMIN 
____
Afin d'arriver sur la page principal de phpMyAdmin :boat:
> Identifiant pour se connecter au démarrage 
> - Username : root
> - Password : root
>  - Port : 3306

>![phpMyAdmin](https://installatron.com/images/remote/ss1_phpmyadmin.png)

<b>La base de donnée est bien initialisé ! :tada: </b>

---
 ### <b>Récupération du projet sur GITHUB </b>
Allons récupérer le projet sur github désormais 
Dans le CLI , placer vous dans votre dossier où vous voulez que le dossier sois stocker

> Pas besoin de créer un dossier pour les fichiers récupérés , il se créera de lui-même :wink:

Par la suite éxécuter la commande suivante

    git clone https://github.com/Mr-Fougere/study_test.git
Après le clonage du repository éxecuter 

    cd study_test

Vous vous trouvez désormais dans le répertoire du projet !

----
 ### <b>Récupérer des gems </b>

Par la suite, sans avoir changer de répertoire éxecuter 

   --- rails serveur

ou

    rails s
---
-->

- ##  Installation sur Linux:penguin:
### Récupération des paquets

Voici les commandes à exécuter afin de récupérer tous les **paquets nécessaires** . 

> L'installation de phpmyadmin est<b> optionnelle</b> sauf si il vous est nécessaire d'accéder à la base de données
> Dans ce cas là, une fenêtre apparaitra 3 fois , sélectionner<b> Apache 2</b> lors de la première , <b>Oui</b> sur la seconde et rentrer un <b>mot de passe </b>sur la troisième.

    sudo apt-get update
    sudo apt-get install  git sqlite3 libsqlite3-dev mysql-server libmysqlclient-dev postgresql postgresql-client postgresql-contrib libpq-dev redis-server memcached imagemagick ffmpeg mupdf mupdf-tools libxml2-dev apache2 php libapache2-mod-php mysql-server php-mysql  ruby-bundler ruby-dev ruby-railties
    /*sudo apt-get phpmyadmin*/
    sudo bundle install
    sudo gem install rails 


On vérifie par la suite si les **paquets principaux** sont installés

    ruby -v
    rails -v
	php -v
	git --version
	mysql --version
	apache2 -v

### Activation des services
On **vérifie** le bon fonctionnement de **apache** et **mysql**

	sudo systemctl status apache2 
    sudo systemctl status mysql
Dans le cas, ou le service est **inactive** voici les commandes à effectuer pour chacun

    sudo systemctl start apache2 
    sudo systemctl start mysql
### Configuration des services

Maintenant que nous avons tous nos paquets, il faut les configurer.
Afin de pouvoir **créer , mettre à jour ,supprimer et lire** sur la **base de donnée** ; RoR a besoin d'un **compte** avec des accès à celle-ci.
Pour créer ce compte, on accède à la console **mysql**.

    sudo mysql

On exécute les requêtes suivantes , pour **créer l'utilisateur** puis lui **donner les droits** sur la futur base de donnée et enfin **rendre effectif** les privilèges ajoutés.

    CREATE USER 'ruby'@'localhost' IDENTIFIED BY 'ruby';
    GRANT ALL PRIVILEGES ON Qulbutoquiz.* TO 'ruby'@'localhost';
    FLUSH privileges;

> Le **nom d'utilisateur** et le **mot de passe** par défaut est **`ruby`**.
> Vous pouvez les **modifier** dans le fichier **`config/database.yaml`**

>#### Optionnel 
>Dans le cas ou vous voulez phpmyadmin voila la démarche à suivre
>
>Copier le fichier de configuration de phpmyadmin dans les sites disponibles via apache2
>`sudo cp /etc/apache2/conf-enabled/phpmyadmin.conf /etc/apache2/sites-available/phpmyadmin.conf`
>Ouvrer le fichier de configuration de apache2
>`sudo nano /etc/apache2/apache2.conf`
>Modifier le fichier en y ajoutant les deux lignes suivantes
> > **#= Include phpMyAdmin
>        Include /etc/phpmyadmin/apache.conf**
> 
> Redémarrer le service apache pour prendre en compte la nouvelle configuration
> `sudo service apache2 restart`

 BRAVO ! :smile: Tous les logiciels sont configurés, on est bientôt sur le point de jouer ! 

 # Mise en route
Notre utilisteur <b>`ruby`</b> maintenant crée, on peut lancer la **création** de la **base de donnée** par Rails 

    rails db:create 
On effectue ls **migrations** pour créer les **tables**

    rails db:migrate
 On y est enfin ! Le lancement du site ! Vous pouvez désormais lancer la commande

>  **rails serveur** ou **rails s**

Vous pouvez maintenant accéder au site via l'adresse 

>  **[127.0.0.1:3000](127.0.0.1:3000)**
 
# Utilisation
 
La base de données est déja pourvu en question et quiz pour jouer directment.
Elle est également pourvu d'un compte **admin** qui a les permissions pour modifier,supprimer et créer des quizz.
> ****Nom d'utilisateur : admin
> Mot de passe : qulbutoquiz****

On retrouve le panel de **quiz** sur la **page principale**.
Le joueurs peut choisir un quiz et devra repondra à **5 questions.**
Il a la possibilité de quitter le quiz puis de revenir à sa dernière question et reprendre le quiz normalement.
Il obtient à la fin de chaque quiz  un **score** sur 5.

Le **joueur** a la possibilitée de se **connecter** depuis l'onglet log in grâce à son nom d'utilisateur et son mot de  passe.
Si il n'en a pas , il a la possibilité d'en **créer** un avec l'aide de okéoké.
Une fois connecté, le joueur a accès aux informations de son compte depuis l'onglet account.
Il peut a tout moment se **déconnecte** via l'icone **logout**
L'outil de **création** de question est pour l'instant très **instable** et ne peux créer des question uniquement avec des réponses de type image et des questions textes.
 
# Conclusion 
 
 Ce projet fut une **rude épreuve** car je devais apprendre un langage avec lequel je devais produire un projet en une semaine. L'épreuve fut du moins **lucratif**, j'ai appris beaucoup du langage RoR au cours de cette semaine , j'ai compris des **méthodologies** à appliquer pour le bon fonctionnement du site. Si je devais le recommencer à zéro, j'aurai une **manière de construction** complétement **différente** : beaucoup plus **découpé** mon **code** et éviter les gros **blocs**. 
### Amusez -vous bien avec Qulbutoquiz!   :grey_question:
#### A la prochaine ! :grinning:
# Construction du site
 


## Construction des chemins du site 

Voici un schéma représentant la façon dont l'utilisateur se déplace à travers chaque page.

```mermaid
graph LR
A{Home} -- get--> B(Quiz question)
A{Home} -- get--> C(Tools)
A{Home} -- get--> D(Account)
B--post-->B
B--get-->I(Result)
B -- patch --> F((Users))
D -- put --> F
D -- patch --> F
C -- get -->G(Quiz List)
C -- get -->H(Question List)
G--get-->K
H--get-->J
G-- patch-->AA
H--patch-->BB
C--get-->TC(Quiz Form)--put-->AA
C--get-->TQ(Question Form)--put-->BB

J(Edit question)--patch-->BB((Question))
K(Edit Quiz)--patch-->AA((Quiz))
