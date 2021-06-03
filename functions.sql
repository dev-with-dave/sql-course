--?  _____ ___  _   _  ____ _____ ___ ___  _   _ ____
--? |  ___/ _ \| \ | |/ ___|_   _|_ _/ _ \| \ | / ___|
--? | |_ | | | |  \| | |     | |  | | | | |  \| \___ \
--? |  _|| |_| | |\  | |___  | |  | | |_| | |\  |___) |
--? |_|   \___/|_| \_|\____| |_| |___\___/|_| \_|____/
--   ____ ___  _   _ _   _ _____
--  / ___/ _ \| | | | \ | |_   _|
-- | |  | | | | | | |  \| | | |
-- | |__| |_| | |_| | |\  | | |
--  \____\___/ \___/|_| \_| |_|
-- retourne le nombre de lignes
SELECT COUNT(*) AS numberOfPayments
FROM payments;

--? exercices :
--? 1) compter le nombres de customers
--? 2) compter le nombres de products
--! correction
--* 1)
SELECT COUNT(*)
FROM customers;

--* 2)
SELECT COUNT(*)
FROM products;

--  ____  _   _ __  __
-- / ___|| | | |  \/  |
-- \___ \| | | | |\/| |
--  ___) | |_| | |  | |
-- |____/ \___/|_|  |_|
-- retourne le resultat de l'addition des lignes de la colonne
SELECT SUM(amount)
FROM payments;

SELECT customerNumber,
  SUM(amount)
FROM payments
GROUP BY customerNumber
ORDER BY customerNumber;

--? exercices :
--? 1) calculer le prix total des commandes de la table orderdetails
--! correction
--* 1)
SELECT SUM(priceEach)
FROM orderdetails;

--     ___     ______
--    / \ \   / / ___|
--   / _ \ \ / / |  _
--  / ___ \ V /| |_| |
-- /_/   \_\_/  \____|
-- retourne le resultat moyen
SELECT AVG(amount)
FROM payments;

--  __  __ ___ _   _
-- |  \/  |_ _| \ | |
-- | |\/| || ||  \| |
-- | |  | || || |\  |
-- |_|  |_|___|_| \_|
-- retourne la valeure minimum
SELECT MIN(amount)
FROM payments;

--  __  __    _    __  __
-- |  \/  |  / \   \ \/ /
-- | |\/| | / _ \   \  /
-- | |  | |/ ___ \  /  \
-- |_|  |_/_/   \_\/_/\_\
-- retourne la valeure max
SELECT MAX(amount)
FROM payments;

--   ____ ___  _   _  ____    _  _____
--  / ___/ _ \| \ | |/ ___|  / \|_   _|
-- | |  | | | |  \| | |     / _ \ | |
-- | |__| |_| | |\  | |___ / ___ \| |
--  \____\___/|_| \_|\____/_/   \_\_|
-- concatene plusieurs colonnes / chaines de caractères
SELECT CONCAT(amount, '$ paid on ', paymentDate) AS message
FROM payments;

--?  1) séléctionner le nom complet des employés qui ont pour travail (jobTitle) Sales Rep
--?  2) séléctionner le nom complet des employés en faisant un self join
--! correction
--* 1)
SELECT CONCAT(firstName, ' ', lastName) AS fullName
FROM employees
WHERE jobTitle = "Sales Rep";

--* 2)
SELECT e.employeeNumber,
  e.firstName,
  e.lastName,
  e.reportsTo,
  m.employeeNumber AS managerNumber,
  CONCAT(m.firstName, ' ', m.lastName) AS manager
FROM employees e
  JOIN employees m ON e.reportsTo = m.employeeNumber;