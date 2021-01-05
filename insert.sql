/*
  L’insertion de données dans une table s’effectue à l’aide de la commande INSERT INTO.
  Cette commande permet au choix d’inclure une seule ligne à la base existante ou
  plusieurs lignes d’un coup.
*/

/*
  Pour insérer des données dans une base, il y a 2 syntaxes principales :

- Insérer une ligne en indiquant les informations pour
chaque colonne existante (en respectant l’ordre)
  - La syntaxe pour remplir une ligne avec cette méthode est la suivante :
*/

INSERT INTO nom_de_table VALUES ('valeur 1', 'valeur 2', ...);

/*
  - Insérer une ligne en spécifiant les colonnes que vous souhaiter compléter.
    Il est possible d’insérer une ligne renseignant seulement une partie des colonnes
      - Cette deuxième solution est très similaire, excepté qu’il faut indiquer le nom des
        colonnes avant “VALUES”. La syntaxe est la suivante :
*/

INSERT INTO nom_de_table (nom_colonne_1, nom_colonne_2, ...)
VALUES ('valeur 1', 'valeur 2', ...);

/*
  il est possible d’ajouter plusieurs lignes à un tableau avec une seule requête.
  Pour ce faire, il convient d’utiliser la syntaxe suivante :
*/
INSERT INTO users (first_name, last_name, age)
VALUES
('Tony', 'Stark', 24),
('Esse', 'Cuelle', 36),
('Alain', 'Térieur', 27),
('Patrick', 'Chirac', 58);

--? exercices :
--? 1) ajouter 2 utilisateurs en utilisant 2 fois la commande INSERT INTO
--? 2) ajouter 4 utilisateurs en utilisant 1 fois la commande INSERT INTO


--! correction
--* 1)
INSERT INTO users (first_name, last_name, age)
VALUES ("Pierre", "Dubois", 37);

INSERT INTO users (first_name, last_name, age)
VALUES ("Jean", "Dupont", 37);

--* 2)
INSERT INTO users (first_name, last_name, age)
VALUES
("Tonald", "Drump", 57)
("Emmanuel", "Macaron", 41)
("Erman", "Zigler", 87)
("Michel", "Sardine", 77);