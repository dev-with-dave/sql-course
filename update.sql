/*
  La commande UPDATE permet d’effectuer des modifications sur des lignes existantes.
  Très souvent cette commande est utilisée avec WHERE pour spécifier
  sur quelles lignes doivent porter la ou les modifications.
*/

-- La syntaxe basique d’une requête utilisant UPDATE est la suivante :
UPDATE nom_de_table
SET nom_colonne_1 = 'nouvelle valeur'
WHERE condition;

/*
  Cette syntaxe permet d’attribuer une nouvelle valeur à la colonne nom_colonne_1
  pour les lignes qui respectent la condition stipulé avec WHERE.
  Il est aussi possible d’attribuer la même valeur à la colonne nom_colonne_1
  pour toutes les lignes d’une table si la condition WHERE n’était pas utilisée.
*/

/*
  Pour spécifier en une seule fois plusieurs modification,
  il faut séparer les attributions de valeur par des virgules.
  Ainsi la syntaxe deviendrait la suivante :
*/

UPDATE nom_de_table
SET colonne_1 = 'valeur 1',
    colonne_2 = 'valeur 2',
    colonne_3 = 'valeur 3'
WHERE condition;

--? exercice :
--? 1)