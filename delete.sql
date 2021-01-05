/*
  La commande DELETE en SQL permet de supprimer des lignes dans une table.
  En utilisant cette commande associé à WHERE il est possible de sélectionner
  les lignes concernées qui seront supprimées.
*/

--! /!\ ATTENTION toute suppression est définitive et irrécupérable

-- La syntaxe pour supprimer des lignes est la suivante :
DELETE FROM nom_de_table
WHERE condition;

-- ! /!\ ATTENTION s’il n’y a pas de condition WHERE alors
--!  toutes les lignes seront supprimées et la table sera alors vide.

-- Pour supprimer toutes les lignes d’une table il convient d’utiliser
-- la commande DELETE sans utiliser de clause conditionnelle.
DELETE FROM nom_de_table;

--? exercices :
--? 1) supprimer tout les utilisateurs qui ont plus de 50 ans
--? 2) supprimer l'utilisateur qui porte le user_id = 4
--? 3) supprimer l'utilisateur qui s'appelle Tonald
--? 4) supprimer tout les utilisateurs

--! correction
--* 1)
DELETE FROM users WHERE age > 50;

--* 2)
DELETE FROM users WHERE user_id = 4;

--* 3)
DELETE FROM users WHERE first_name = "Tonald";

--* 4)
DELETE FROM users;
-- ou
TRUNCATE TABLE users;