/*
  La création d’une base de données en SQL est possible en ligne de commande.
  Même si les systèmes de gestion de base de données (SGBD) sont souvent utilisés
  pour créer une base, il convient de connaître la commande à utiliser, qui est très simple.
*/
CREATE DATABASE some_database_name;

/*
  La commande CREATE TABLE permet de créer une table en SQL.
  Une table est une entitée qui est contenu dans une base de données pour stocker
  des données ordonnées dans des colonnes. La création d’une table sert à définir
  les colonnes et le type de données qui seront contenus dans chacun des colonne
  (entier, chaîne de caractères, date, valeur binaire …), on peut aussi y ajouter des contraintes.

  Qu'est ce qu'une contrainte?

  Les contraintes permettent de limiter le type de données à insérer dans une table.
  Les contraintes les plus communes sont :

  - NOT NULL
  - UNIQUE
  - PRIMARY KEY
  - FOREIGN KEY
*/
CREATE TABLE users (
  user_id INTEGER AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(15) NOT NULL,
  age INTEGER NOT NULL,
  is_admin BOOLEAN DEFAULT false
);

/*
  La commande ALTER TABLE en SQL permet de modifier une table existante.
  Idéal pour ajouter une colonne, supprimer une colonne ou modifier une colonne existante,
  par exemple pour changer le type.
*/
ALTER TABLE users
ADD COLUMN emaile INT NOT NULL;

/*
  Pour modifier une colonne, comme par exemple changer le type d’une colonne,
  il y a différentes syntaxes selon le SGBD.
*/
-- MySQL
ALTER TABLE users
MODIFY emaile TEXT NOT NULL;
/*
  postgreSQL
    ALTER TABLE users
    ALTER COLUMN email TYPE TEXT NOT NULL;
*/

/*
  Pour renommer une colonne, il convient d’indiquer l’ancien nom de la colonne
  et le nouveau nom de celle-ci.
*/
-- MySQL
ALTER TABLE users
CHANGE emaile email TEXT NOT NULL;
/*
  postgreSQL
    ALTER TABLE users
    RENAME COLUMN emaile TO email;
*/

ALTER TABLE products
ADD COLUMN user_id INT,
ADD CONSTRAINT product_user_fk FOREIGN KEY (user_id) REFERENCES users(user_id);

ALTER TABLE products
DROP CONSTRAINT product_user_fk,
DROP COLUMN user_id;


/*
  La commande DROP TABLE en SQL permet de supprimer définitivement une table
  d’une base de données. Cela supprime en même temps les éventuels
  contraintes et permissions associées à cette table.
*/
DROP TABLE users;

/*
  En SQL, la commande TRUNCATE permet de supprimer toutes les données d’une table
  sans supprimer la table en elle-même. En d’autres mots, cela permet de purger la table.
  Cette instruction diffère de la commande DROP qui à pour but de supprimer les données
  ainsi que la table qui les contient.
*/
TRUNCATE TABLE customers;

ALTER TABLE employees ADD COLUMN salary INTEGER NOT NULL DEFAULT 2000;

ALTER TABLE employees DROP COLUMN salary;

/*
  En SQL, la commande DROP DATABASE permet de supprimer totalement une base de données
  et tout ce qu’elle contient. Cette commande est à utiliser avec beaucoup d’attention
  car elle permet de supprimer tout ce qui est inclus dans une base:
  les tables, les données, les index …
*/
DROP DATABASE classicmodels;