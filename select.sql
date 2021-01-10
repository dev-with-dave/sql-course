-- SHOW DATABASES : permet de voir toutes les bases de données
-- USE <nom de la base de donnée> : permet d'utiliser cette base de donnée
-- SHOW TABLES : permet de voir toutes les tables d'une base de données
-- DESCRIBE <nom de la table> : permet de voir toutes les colonnes et le type de donnée de la table en question

--  ____  _____ _     _____ ____ _____
-- / ___|| ____| |   | ____/ ___|_   _|
-- \___ \|  _| | |   |  _|| |     | |
--  ___) | |___| |___| |__| |___  | |
-- |____/|_____|_____|_____\____| |_|

-- L’utilisation la plus courante de SQL consiste à lire des données issues de la base de données.
-- Cela s’effectue grâce à la commande SELECT, qui retourne des enregistrements dans un tableau de résultat.
-- Cette commande peut sélectionner une ou plusieurs colonnes d’une table.

-- tout séléctionner
SELECT * FROM customers;

--? exercices :
--? 1) séléctionner tout dans la table products
--? 2) séléctionner tout dans la table offices
--? 3) séléctionner tout dans la table employees
--? 4) séléctionner tout dans la table orders

--! correction :
--* 1)
SELECT * FROM products;
--* 2)
SELECT * FROM offices;
--* 3)
SELECT * FROM employees;
--* 4)
SELECT * FROM orders;

-- séléctionner juste certains champs
SELECT customerNumber, customerName FROM customers;

--? exercices :
--? 1) séléctionner le nom du produit, sa déscription, sa quantité restante et son prix dans la table products
--? 2) séléctionner le nom complet (first + last), l'email et le job des employés de la table employees
--? 3) séléctionner le status, la date de commande et la date d'envoi des commandes de la table orders
--? 4) séléctionner le nom, l'addresse, la ville et le pays des clients de la table customers

--! correction :
--* 1)
SELECT productName, quantityInStock, buyPrice FROM products;
--* 2)
SELECT firstName, lastName, email, jobTitle FROM employees;
--* 3)
SELECT status, orderDate, shippedDate FROM orders;
--* 4)
SELECT customerName, addressLine1, city, country FROM customers;

--  ____  _____ _     _____ ____ _____   ____ ___ ____ _____ ___ _   _  ____ _____
-- / ___|| ____| |   | ____/ ___|_   _| |  _ \_ _/ ___|_   _|_ _| \ | |/ ___|_   _|
-- \___ \|  _| | |   |  _|| |     | |   | | | | |\___ \ | |  | ||  \| | |     | |
--  ___) | |___| |___| |__| |___  | |   | |_| | | ___) || |  | || |\  | |___  | |
-- |____/|_____|_____|_____\____| |_|   |____/___|____/ |_| |___|_| \_|\____| |_|

-- L’utilisation de la commande SELECT en SQL permet de lire toutes les données d’une ou plusieurs colonnes.
-- Cette commande peut potentiellement afficher des lignes en doubles.
-- Pour éviter des redondances dans les résultats il faut simplement ajouter DISTINCT après le mot SELECT.

-- séléctionner en enlevant les doublons
SELECT DISTINCT city FROM customers;

--? exercices :
--? 1) séléctionner tout les états de la table customers en enlevant les doublons

--! correction
--* 1)
SELECT DISTINCT state FROM customers;

-- __        ___   _ _____ ____  _____
-- \ \      / / | | | ____|  _ \| ____|
--  \ \ /\ / /| |_| |  _| | |_) |  _|
--   \ V  V / |  _  | |___|  _ <| |___
--    \_/\_/  |_| |_|_____|_| \_\_____|

-- La commande WHERE dans une requête SQL permet d’extraire les lignes d’une
-- base de données qui respectent une condition. Cela permet d’obtenir uniquement les informations désirées.
SELECT * FROM customers WHERE customerNumber = 242;

--? exercices :
--?  1) séléctionner le nom et le numéro de téléphone des clients qui habitent à Boston dans la table customers
--?  2) séléctionner le nom et le numéro de téléphone des clients qui habitent à London dans la table customers
--?  3) séléctionner le nom, la quantité et le prix des produits qui ont pour productCode S12_1099 dans la table products
--?  4) séléctionner le nom complet des employés qui ont pour travail (jobTitle) Sales Rep

--! correction :
--* 1)
SELECT customerName, phone FROM customers WHERE city = "Boston";
--* 2)
SELECT customerName, phone FROM customers WHERE city = "London";
--* 3)
SELECT productName, quantityInStock, buyPrice FROM products WHERE productCode = "S12_1099";
--* 4)
SELECT firstName, lastName FROM employees WHERE jobTitle = "Sales Rep";

--   ___  ____  ____  _____ ____    ______   __
--  / _ \|  _ \|  _ \| ____|  _ \  | __ ) \ / /
-- | | | | |_) | | | |  _| | |_) | |  _ \\ V /
-- | |_| |  _ <| |_| | |___|  _ <  | |_) || |
--  \___/|_| \_\____/|_____|_| \_\ |____/ |_|

-- La commande ORDER BY permet de trier les lignes dans un résultat d’une requête SQL.
-- Il est possible de trier les données sur une ou plusieurs colonnes, par ordre ascendant ou descendant.
-- par ordre décroissant
SELECT
customerNumber,
customerName,
phone,
addressLine1,
city,
state
FROM customers
ORDER BY customerName DESC;

-- par ordre croissant
SELECT
customerNumber,
customerName,
phone,
addressLine1,
city,
state
FROM customers
ORDER BY customerName;

-- ou
SELECT
customerNumber,
customerName,
phone,
addressLine1,
city,
state
FROM customers
ORDER BY customerName ASC;

--? exercices :
--?  1) séléctionner la date de paiement et le montant de chaque paiement dans la table payements en ordonnant par date de manière décroissante
--?  2) séléctionner la date de paiement et le montant pour les paiements supérieurs à 60000 dans la table payements en ordonnant par montant de manière decroissante

--! correction :
--* 1)
SELECT paymentDate, amount FROM payments ORDER BY paymentDate DESC;
--* 2)
SELECT paymentDate, amount FROM payments WHERE amount > 60000 ORDER BY amount DESC;

--  _     ___ __  __ ___ _____
-- | |   |_ _|  \/  |_ _|_   _|
-- | |    | || |\/| || |  | |
-- | |___ | || |  | || |  | |
-- |_____|___|_|  |_|___| |_|

-- La clause LIMIT est à utiliser dans une requête SQL pour spécifier
-- le nombre maximum de résultats que l’ont souhaite obtenir.
SELECT
customerNumber,
customerName,
phone,
addressLine1,
city,
state
FROM customers
ORDER BY customerName DESC
LIMIT 20;

--? exercices :
--? 1) séléctionner tout dans la table orders pour les 5 dernières commandes
--? 2) séléctionner le nom du produit, sa quantité et son prix dans la table products
--?    pour les 20 produits qui ont le moins de quantité

--! correction :
--* 1)
SELECT * FROM orders ORDER BY orderDate DESC LIMIT 5;
--* 2)
SELECT productName, quantityInStock, buyPrice FROM products ORDER BY quantityInStock LIMIT 20;

-- Cette clause est souvent associé à un OFFSET,
-- c’est-à-dire effectuer un décalage sur le jeu de résultat.
-- Ces 2 clauses permettent par exemple d’effectuer des système de pagination
-- (exemple : récupérer les 10 articles de la page 4).

--   ___  _____ _____ ____  _____ _____
--  / _ \|  ___|  ___/ ___|| ____|_   _|
-- | | | | |_  | |_  \___ \|  _|   | |
-- | |_| |  _| |  _|  ___) | |___  | |
--  \___/|_|   |_|   |____/|_____| |_|

-- avec MySQL on a le choix entre 2 syyntaxes
SELECT customerName, country FROM customers ORDER BY customerName LIMIT 20 OFFSET 0; -- récupère les 20 premiers
-- ou
SELECT customerName, country FROM customers ORDER BY customerName LIMIT 20, 0; -- récupère les 20 premiers

SELECT customerName, country FROM customers ORDER BY customerName LIMIT 20 OFFSET 20; -- récupère les 20 suivants
-- ou
SELECT customerName, country FROM customers ORDER BY customerName LIMIT 20, 20; -- récupère les 20 suivants

--? exercices :
--? 1) séléctionner 25 entrées dans la table orders à partir de la 50ème, ne récupérer que le orderNumber, orderDate, status en les triant par date
--? 2) séléctionner 25 entrées dans la table orders à partir de la 25ème (ce qui équivaut à la 2eme page dans le cas d'un site web),
--?    ne récupérer que le orderNumber, orderDate, status en les triant par date
--?    pour toutes les entrées dont le status contient "ship"
--? 3) faire de même que 2) mais en récupérant la 3ème et 4èeme page

--! correction
--* 1)
SELECT orderNumber, orderDate, status FROM orders ORDER BY orderDate LIMIT 25 OFFSET 50;
--* 2)
SELECT orderNumber, orderDate, status FROM orders WHERE status ORDER BY orderDate LIMIT 25 OFFSET 25;
--* 3)
SELECT orderNumber, orderDate, status FROM orders WHERE status ORDER BY orderDate LIMIT 25 OFFSET 50;
SELECT orderNumber, orderDate, status FROM orders WHERE status ORDER BY orderDate LIMIT 25 OFFSET 75;

--   ___  ____       __     _    _   _ ____
--  / _ \|  _ \     / /    / \  | \ | |  _ \
-- | | | | |_) |   / /    / _ \ |  \| | | | |
-- | |_| |  _ <   / /    / ___ \| |\  | |_| |
--  \___/|_| \_\ /_/    /_/   \_\_| \_|____/

-- Une requête SQL peut être restreinte à l’aide de la condition WHERE.
-- Les opérateurs logiques AND et OR peuvent être utilisées au sein de la commande WHERE pour combiner des conditions.
SELECT customerName, city, country FROM customers WHERE city = "London" OR country = "France";
SELECT customerName, city, country FROM customers WHERE city = "London" AND country = "UK";

--? exercices:
--? 1) séléctionner le nom du produit, sa quantité et son prix pour les produits qui ont une quantité superieure à 5000 ou un prix supérieur à 60
--? 2) séléctionner les commandes dont le status est "Shipped" et la date de commande superieure au 30 avril 2005 (attention date au format YYYY-MM-DD)
--? 3) séléctionner le produit avec le code "S24_2000" et dont le prix total est superieur à 500 (peut être quelque chose à faire avec le prix et la quantité pour avoir le prix total)

--! correction
--* 1)
SELECT productName, quantityInStock, buyPrice FROM products WHERE quantityInStock > 5000 OR buyPrice > 60;
--* 2)
SELECT * FROM orders WHERE status = "Shipped" AND orderDate > '2005-04-30';
--* 3)
SELECT productCode, quantityInStock, buyPrice FROM products WHERE productCode = "S24_2000" AND (quantityInStock * buyPrice > 500);

--  _   _  ___ _____
-- | \ | |/ _ \_   _|
-- |  \| | | | || |
-- | |\  | |_| || |
-- |_| \_|\___/ |_|

-- séléctionner selon condition négative
SELECT customerName, country FROM customers WHERE NOT country = "USA" ORDER BY country;
SELECT customerName, country FROM customers WHERE NOT (country = "USA" OR country = "Germany") ORDER BY country;

--? exercices:
--? 1) séléctionner tous les employés qui n'ont pas pour jobTitle : Sales Rep
--? 2) séléctionner les bureaux qui ne sont pas situés aux USA et les classer par pays

--! correction
--* 1)
SELECT * FROM employees WHERE NOT jobTitle = "Sales Rep";
--* 2)
SELECT * FROM offices WHERE NOT country = "USA" ORDER BY country;

--  ___ _   _
-- |_ _| \ | |
--  | ||  \| |
--  | || |\  |
-- |___|_| \_|

-- L’opérateur logique IN dans SQL  s’utilise avec la commande WHERE pour vérifier
-- si une colonne est égale à une des valeurs comprise dans un set de valeurs déterminés.
-- C’est une méthode simple pour vérifier si une colonne est égale à une valeur
-- OU une autre valeur OU une autre valeur et ainsi de suite,
-- sans avoir à utiliser de multiple fois l’opérateur OR.
SELECT customerName, city FROM customers WHERE city = "London" OR city = "Paris" OR city = "NYC" OR city = "Boston" ORDER BY city;
SELECT customerName, city FROM customers WHERE city IN ("London", "Paris", "NYC", "Boston") ORDER BY city;
SELECT customerName, city FROM customers WHERE city NOT IN ("London", "Paris", "NYC", "Boston") ORDER BY city;
-- On peut aussi l'utiliser avec le NOT

--? exercices :
--? 1) séléctionner le nom et la ville et le pays des clients qui habitent en france, aux états unis ou en allemagne, ordonner par pays
--? 2) séléctionner les bureaux qui ne sont pas situés dans aux USA en australie ou au royaume unis et les classer par pays
--? 3) séléctionner le nom du produit, sa quantité et son prix ou le prix est égal à 75.16, 101.51, 68.30, 29.34 et 46.53, les trier par prix décroissant

--! correction
--* 1)
SELECT customerName, city, country FROM customers WHERE country IN ("USA", "France", "Germany") ORDER BY country;
--* 2)
SELECT * FROM offices WHERE country NOT IN ("USA", "Australia", "UK") ORDER BY country;
--* 3)
SELECT productName, quantityInStock, buyPrice FROM products WHERE buyPrice IN (75.16, 101.51, 68.30, 29.34, 46.53) ORDER BY buyPrice DESC;

--  ____  _____ _______        _______ _____ _   _
-- | __ )| ____|_   _\ \      / / ____| ____| \ | |
-- |  _ \|  _|   | |  \ \ /\ / /|  _| |  _| |  \| |
-- | |_) | |___  | |   \ V  V / | |___| |___| |\  |
-- |____/|_____| |_|    \_/\_/  |_____|_____|_| \_|

-- L’opérateur BETWEEN est utilisé dans une requête SQL pour sélectionner un intervalle de données
--  dans une requête utilisant WHERE.
-- L’intervalle peut être constitué de chaînes de caractères, de nombres ou de dates.
-- L’exemple le plus concret consiste par exemple à récupérer uniquement les enregistrements entre 2 dates définies.
SELECT * FROM payments WHERE amount BETWEEN 10000 AND 20000 ORDER BY amount;
-- au lieu de faire :
SELECT * FROM payments WHERE amount > 10000 AND amount < 20000 ORDER BY amount;

--? exercices :
--? 1) séléctionner le nom du produit, sa quantité, son prix et le vendeur pour les produits dont le prix est entre 20 et 50 ordonner par prix
--? 2) selectionner tout les champs de la table orderdetails pour les commandes dont le prix est entre 100 et 200 ordonner par quantité et ne prendre que les 50 premieresavec le plus de quantité
--? 3) selectionner tout les champs de la table orderdetails pour les commandes dont le numéro de commande est entre 10400 et 10500 ordonner par numéro de commande
--? 4) selectionner tout les champs de la table orderdetails pour les commandes dont le numéro de commande n'est pas entre 10120 et 10500 ordonner par numéro de commande
--? 5) séléctionner la date de commande, le status et les commentaires dans la table orders pour toutes les commandes passé entre
--?    le 3 mars 2003 et le 27 juin 2004 en ordonnant par date de commande

--! correction
--* 1)
SELECT productName, productVendor, buyPrice, quantityInStock FROM products WHERE buyPrice BETWEEN 20 AND 50 ORDER BY buyPrice;
--* 2)
SELECT * FROM orderdetails WHERE priceEach BETWEEN 100 AND 200 ORDER BY quantityOrdered DESC LIMIT 50;
--* 3)
SELECT * FROM orderdetails WHERE orderNumber BETWEEN 10400 AND 10500 ORDER BY orderNumber;
--* 4)
SELECT * FROM orderdetails WHERE orderNumber NOT BETWEEN 10120 AND 10500 ORDER BY orderNumber;
--* 5)
SELECT orderDate, status, comments FROM orders WHERE orderDate BETWEEN "2003-03-03" AND "2004-06-27" ORDER BY orderDate;

--  ___ ____    _   _ _   _ _     _
-- |_ _/ ___|  | \ | | | | | |   | |
--  | |\___ \  |  \| | | | | |   | |
--  | | ___) | | |\  | |_| | |___| |___
-- |___|____/  |_| \_|\___/|_____|_____|

-- Dans le langage SQL, l’opérateur IS permet de filtrer les résultats qui contiennent la valeur NULL.
--  Cet opérateur est indispensable car la valeur NULL est une valeur inconnue et
--  ne peut par conséquent pas être filtrée par les opérateurs de comparaison
-- (cf. égal, inférieur, supérieur ou différent).
SELECT customerName, addressLine1, addressLine2 WHERE addressLine2 IS NULL;

--? exercices :
--? 1) séléctionner la date de commande, le status et les commentaires dans la table orders pour toutes les commandes passé entre
--?    le 3 mars 2003 et le 27 juin 2004 et qui ont des commentaires en ordonnant par date de commande
--? 2) séléctionner tous les champs de la table employés pour les employés qui n'ont pas de "reportsTo"

--! correction
--* 1)
SELECT orderDate, status, comments FROM orders WHERE orderDate BETWEEN "2003-03-03" AND "2004-06-27" AND comments IS NOT NULL ORDER BY orderDate;
--* 2)
SELECT * FROM employees WHERE reportsTo IS NULL;

--  _     ___ _  _______
-- | |   |_ _| |/ / ____|
-- | |    | || ' /|  _|
-- | |___ | || . \| |___
-- |_____|___|_|\_\_____|

-- L’opérateur LIKE est utilisé dans la clause WHERE des requêtes SQL.
-- Ce mot-clé permet d’effectuer une recherche sur un modèle particulier.
-- Il est par exemple possible de rechercher les enregistrements dont la valeur d’une colonne
--  commence par telle ou telle lettre. Les modèles de recherches sont multiple.

--* % : n'importe quel lettre / chiffre ou série de lettres / chiffres
--* _ : une lettre ou chiffre
SELECT customerName, country FROM customers WHERE customerName LIKE "%sign%";
SELECT customerName, country FROM customers WHERE customerName LIKE "sign%";
SELECT customerName, country FROM customers WHERE customerName LIKE "mini%";
SELECT customerName, country FROM customers WHERE customerName LIKE "%mini%";
SELECT customerName, country FROM customers WHERE customerName LIKE "%mini";
SELECT customerName, country FROM customers WHERE customerName LIKE "%co";

--? exercices :
--? 1) séléctionner le nom du produit, son prix et sa quantité dans la table products pour tout les produits contentant "mercedes" dans son nom
--? 2) séléctionner tout les champs dans la tables employees pour les entrées dont le lastName termine par "son";
--? 3) séléctionner tout les champs dans la tables employees pour les entrées dont le firstName commence par "l";

--! correction
--* 1)
SELECT productName FROM products WHERE productName LIKE "%mercedes%";
--* 2)
SELECT * FROM employees WHERE lastName LIKE "%son";
--* 3)
SELECT * FROM employees WHERE firstName LIKE "l%";


--?      _  ___ ___ _   _ _____ _   _ ____  _____ ____
--?     | |/ _ \_ _| \ | |_   _| | | |  _ \| ____/ ___|
--?  _  | | | | | ||  \| | | | | | | | |_) |  _| \___ \
--? | |_| | |_| | || |\  | | | | |_| |  _ <| |___ ___) |
--?  \___/ \___/___|_| \_| |_|  \___/|_| \_\_____|____/
-- Les jointures en SQL permettent d’associer plusieurs tables dans une même requête.
-- Cela permet d’exploiter la puissance des bases de données relationnelles pour obtenir des résultats
--  qui combinent les données de plusieurs tables de manière efficace.

-- En général, les jointures consistent à associer des lignes de 2 tables en associant l’égalité des valeurs
-- d’une colonne d’une première table par rapport à la valeur d’une colonne d’une seconde table.
-- Imaginons qu’une base de 2 données possède une table “utilisateur” et une autre table “adresse” qui contient
-- les adresses de ces utilisateurs. Avec une jointure, il est possible d’obtenir les données de l’utilisateur
-- et de son adresse en une seule requête.

--  ___ _   _ _   _ _____ ____        _  ___ ___ _   _
-- |_ _| \ | | \ | | ____|  _ \      | |/ _ \_ _| \ | |
--  | ||  \| |  \| |  _| | |_) |  _  | | | | | ||  \| |
--  | || |\  | |\  | |___|  _ <  | |_| | |_| | || |\  |
-- |___|_| \_|_| \_|_____|_| \_\  \___/ \___/___|_| \_|

-- pour séléctionner des entrées liées entre 2 tables
-- retourne les enregistrements lorsqu’il y a au moins une ligne dans chaque colonne qui correspond à la condition.
-- le mot clé INNER est optionnel
SELECT o.orderNumber, o.orderDate, o.status, c.customerName, c.phone
FROM orders o
JOIN customers c
  ON o.customerNumber = c.customerNumber;

SELECT o.orderNumber, o.orderDate, o.status, c.customerName, c.phone
FROM orders o
INNER JOIN customers c
  ON o.customerNumber = c.customerNumber;

-- syntaxe implicit
SELECT o.orderNumber, o.orderDate, o.status, c.customerName, c.phone
FROM orders o, customers c
WHERE o.customerNumber = c.customerNumber;

-- tout les mots clés vu jusqu'a maintenant s'appliquent de la même façon
SELECT o.orderNumber, o.orderDate, o.status, c.customerName, c.phone
FROM orders o
JOIN customers c
  ON o.customerNumber = c.customerNumber
WHERE o.orderNumber > 10200
AND o.orderNumber
BETWEEN 10200 AND 10500
ORDER BY o.orderNumber
LIMIT 25
OFFSET 25;

--? exercices :
--? 1) séléctionner dans la table customers le customerName faire une jointure sur la table payments pour y récupérer
--?    le montant et la date de paiement et les trier par montant
--? 2) rajouter à la requête précédente la orderDate et le status de la table orders et ne garder que les 30 premiers resultats

--! correction
--* 1)
SELECT c.customerName, p.amount, p.paymentDate
FROM customers c
JOIN payments p
  ON c.customerNumber = p.customerNumber
ORDER BY p.amount;
--* 2)
SELECT c.customerName, p.amount, o.orderDate, p.paymentDate, o.status
FROM customers c
JOIN payments p
  ON c.customerNumber = p.customerNumber
JOIN orders o
  ON o.customerNumber = c.customerNumber
ORDER BY p.amount
LIMIT 30;

--  ____  _____ _     _____       _  ___ ___ _   _
-- / ___|| ____| |   |  ___|     | |/ _ \_ _| \ | |
-- \___ \|  _| | |   | |_     _  | | | | | ||  \| |
--  ___) | |___| |___|  _|   | |_| | |_| | || |\  |
-- |____/|_____|_____|_|      \___/ \___/___|_| \_|

-- En SQL, un SELF JOIN correspond à une jointure d’une table avec elle-même.
-- Ce type de requête n’est pas si commun mais très pratique dans le cas où une table
-- lie des informations avec des enregistrements de la même table.
SELECT
e.employeeNumber,
e.firstName,
e.lastName,
e.reportsTo,
m.employeeNumber AS managerNumber,
m.firstName,
m.lastName
FROM employees e
JOIN employees m
ON e.reportsTo = m.employeeNumber;

--   ___  _   _ _____ _____ ____        _  ___ ___ _   _
--  / _ \| | | |_   _| ____|  _ \      | |/ _ \_ _| \ | |
-- | | | | | | | | | |  _| | |_) |  _  | | | | | ||  \| |
-- | |_| | |_| | | | | |___|  _ <  | |_| | |_| | || |\  |
--  \___/ \___/  |_| |_____|_| \_\  \___/ \___/___|_| \_|

-- Dans le langage SQL, la commande LEFT JOIN (aussi appelée LEFT OUTER JOIN) est un type de jointure entre 2 tables.
-- Cela permet de lister tous les résultats de la table de gauche (left = gauche)
-- même s’il n’y a pas de correspondance dans la deuxième tables.
--! le mot clé OUTER est optionnel
SELECT c.customerNumber, c.customerName, o.orderNumber
FROM customers c
LEFT OUTER JOIN
orders o
  ON c.customerNumber = o.customerNumber
ORDER BY c.customerNumber;

-- En SQL, la commande RIGHT JOIN (ou RIGHT OUTER JOIN) est un type de jointure entre 2 tables
-- qui permet de retourner tous les enregistrements de la table de droite (right = droite)
-- même s’il n’y a pas de correspondance avec la table de gauche.
-- S’il y a un enregistrement de la table de droite qui ne trouve pas de correspondance dans la table de gauche,
-- alors les colonnes de la table de gauche auront NULL pour valeur.
--! le mot clé OUTER est optionnel
SELECT c.customerNumber, c.customerName, o.orderNumber
FROM customers c
RIGHT OUTER JOIN
orders o
  ON c.customerNumber = o.customerNumber
ORDER BY c.customerNumber;

--  _   _    _  _____ _   _ ____      _    _           _  ___ ___ _   _
-- | \ | |  / \|_   _| | | |  _ \    / \  | |         | |/ _ \_ _| \ | |
-- |  \| | / _ \ | | | | | | |_) |  / _ \ | |      _  | | | | | ||  \| |
-- | |\  |/ ___ \| | | |_| |  _ <  / ___ \| |___  | |_| | |_| | || |\  |
-- |_| \_/_/   \_\_|  \___/|_| \_\/_/   \_\_____|  \___/ \___/___|_| \_|

-- permet de faire une jointure naturelle entre 2 tables. Cette jointure s’effectue à la condition
-- qu’il y ai des colonnes du même nom et de même type dans les 2 tables.

--! A noter : puisqu’il faut le même nom de colonne sur les 2 tables, cela empêche d’utiliser
--! certaines règles de nommages pour le nom des colonnes.
--! Il n’est par exemple pas possible de préfixer le nom des colonnes sous peine d’avoir malheureusement
--! 2 noms de colonnes différents.
SELECT c.customerName, p.amount FROM customers c NATURAL JOIN payments p;

--? exercices :
--? 1) faire une jointure naturelle sur la table employees et offices en ne séléctionnant que
--?    le firstName et lastName dans la table employees et addressLine1, city et country dans la table offices

--! correction
--* 1)
SELECT e.firstName, e.lastName, o.addressLine1, o.city, o.country FROM employees e NATURAL JOIN offices o;

--   ____ ____   ___  ____ ____        _  ___ ___ _   _
--  / ___|  _ \ / _ \/ ___/ ___|      | |/ _ \_ _| \ | |
-- | |   | |_) | | | \___ \___ \   _  | | | | | ||  \| |
-- | |___|  _ <| |_| |___) |__) | | |_| | |_| | || |\  |
--  \____|_| \_\\___/|____/____/   \___/ \___/___|_| \_|

-- Dans le langage SQL, la commande CROSS JOIN est un type de jointure sur 2 tables SQL qui permet de retourner
-- le produit cartésien. Autrement dit, cela permet de retourner chaque ligne d’une table avec chaque ligne
-- d’une autre table. Ainsi effectuer le produit cartésien d’une table A qui contient 30 résultats avec
-- une table B de 40 résultats va produire 1200 résultats (30 x 40 = 1200).
-- En général la commande CROSS JOIN est combinée avec la commande WHERE pour filtrer
-- les résultats qui respectent certaines conditions.
SELECT e.employeeNumber, e.firstName, o.officeCode FROM employees e CROSS JOIN offices o;
-- ou
SELECT e.employeeNumber, e.firstName, o.officeCode FROM employees e, offices o;

--  _   _ ____ ___ _   _  ____
-- | | | / ___|_ _| \ | |/ ___|
-- | | | \___ \| ||  \| | |  _
-- | |_| |___) | || |\  | |_| |
--  \___/|____/___|_| \_|\____|

SELECT c.customerName, o.orderDate FROM customers c JOIN orders o USING (customerNumber);

--? exercices :
--? 1) séléctionner customerName dans la table customers, séléctionner amount et
--?    paymentDate de la table payments en utilisant une jointure avec le mot clé USING


--! correction
--* 1)
SELECT c.customerName, p.amount, p.paymentDate FROM customers c JOIN payments p USING (customerNumber);

--  _   _ _   _ ___ ___  _   _
-- | | | | \ | |_ _/ _ \| \ | |
-- | | | |  \| || | | | |  \| |
-- | |_| | |\  || | |_| | |\  |
--  \___/|_| \_|___\___/|_| \_|

-- La commande UNION de SQL permet de mettre bout-à-bout les résultats de plusieurs requêtes utilisant
-- elles-même la commande SELECT. C’est donc une commande qui permet de concaténer les résultats de 2 requêtes ou plus.
-- Pour l’utiliser il est nécessaire que chacune des requêtes à concaténer retournes le même nombre de colonnes,
-- avec les mêmes types de données et dans le même ordre.

--! A savoir : par défaut, les enregistrements exactement identiques ne seront pas répétés
--! dans les résultats. Pour effectuer une union dans laquelle même les lignes dupliquées sont affichées
--! il faut plutôt utiliser la commande UNION ALL.

SELECT orderNumber, orderDate, "active" AS type
FROM orders
WHERE orderDate >= "2005-01-01"
UNION
SELECT orderNumber, orderDate, "archived" AS type
FROM orders
WHERE orderDate < "2005-01-01"
ORDER BY orderDate DESC;

-- sous requêtes
-- En SQL on peut utiliser le résultat d'une requête au sein d'une requête

SELECT customerNumber, customerName, city, country
FROM customers
WHERE city IN (
  SELECT city
  FROM customers
  WHERE customerNumber > 480
  )
AND customerNumber > 300;