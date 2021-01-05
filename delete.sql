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
--? 1)