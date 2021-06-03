BEGIN;

DROP DATABASE IF EXISTS blog;
CREATE DATABASE IF NOT EXISTS blog DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE blog;

DROP TABLE IF EXISTS users, comments, categories, posts, category_categorize_post;

CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(42) NOT NULL,
  last_name VARCHAR(42) NOT NULL,
  username VARCHAR(42) NOT NULL,
  email VARCHAR(42) NOT NULL,
  password VARCHAR(42) NOT NULL,
  is_admin BOOLEAN DEFAULT false,
  created_at DATE DEFAULT NOW(),
  updated_at DATE
);

INSERT INTO users (first_name, last_name, username, email, password, is_admin, created_at)
VALUES
("David", "Nogueira", "DavidN", "test@test.com", "$f4Df5d8mfo5", true, '2018-09-01');
INSERT INTO users (first_name, last_name, username, email, password, created_at)
VALUES
('Sumner', 'Roughey', 'sroughey7', 'sroughey7@ftc.gov', '$6x3MdA', '2019-01-02'),
('Lammond', 'Bussy', 'lbussy5', 'lbussy5@reverbnation.com', '$jEle2KC', '2019-04-28'),
('Toma', 'Fenkel', 'tfenkel2', 'tfenkel2@independent.co.uk', '$d69IAlQ0dZ', '2019-05-13'),
('Mohandis', 'Scragg', 'mscragg3', 'mscragg3@aol.com', '$JOaDIFRE2DcN', '2019-05-13'),
('Hermione', 'Elsegood', 'helsegoodb', 'helsegoodb@amazon.com', '$6kERukKCLu', '2019-05-25'),
('Jeremy', 'Duggan', 'jduggan0', 'jduggan0@parallels.com', '$KmZbdVJouHuj', '2019-05-30'),
('Kristopher', 'Judd', 'kjudd1', 'kjudd1@about.com', '$OhmXW5', '2019-07-10'),
('Willem', 'Alker', 'walker4', 'walker4@alibaba.com', '$ujjAeWPUrzX', '2019-08-11'),
('Lanie', 'Hullock', 'lhullock9', 'lhullock9@sun.com', '$7YysTGl', '2019-12-20'),
('Winifield', 'Kivelhan', 'wkivelhan6', 'wkivelhan6@google.fr', '$OFkUjZgI7ry', '2020-01-01'),
('Selie', 'Randlesome', 'srandlesomea', 'srandlesomea@cloudflare.com', '$tlleHx', '2020-02-15');

CREATE TABLE posts (
  post_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(42) NOT NULL,
  content TEXT NOT NULL,
  user_id INT NOT NULL REFERENCES users(user_id),
  created_at DATE DEFAULT NOW(),
  updated_at DATE
);

INSERT INTO posts (title, content, user_id, created_at, updated_at)
VALUES
("Non pulvinar suscipit.", "Amet habitasse ipsum vulputate dis. Suspendisse ultrices integer arcu erat curabitur.", 1, '2018-09-03', NULL),
("Dictum donec tempor.", "Non in eu risus. Venenatis luctus felis donec ad suscipit. Nibh sem tellus.", 1, '2019-05-13', '2019-09-08'),
("Lectus fames sapien!", "Consequat fames vulputate dignissim scelerisque volutpat et eros nec! Augue nulla penatibus dolor.", 1, '2019-06-11', '2020-02-28'),
("Curae dolor viverra.", "Volutpat taciti consectetur morbi iaculis. Vestibulum varius, et risus primis. Fusce, porta lacus.", 1, '2019-09-17', NULL),
("Litora montes suspendisse.", "Elit condimentum justo, integer justo. Parturient tempor lacus ridiculus lobortis. Inceptos ipsum curae;.", 1, '2019-10-20', '2019-11-06'),
("Et velit purus.", "Leo vitae nam erat per nunc nunc sodales. Dis habitasse sed a mauris.", 1, '2020-03-08', '2020-04-21'),
("Elit, vivamus nibh.", "Lorem vitae rhoncus quis venenatis risus ultrices scelerisque mauris! Aptent, habitasse vulputate eu.", 1, '2020-02-18', NULL),
("Senectus sagittis mi.", "Ridiculus consequat integer lobortis luctus nec. Lorem nam cursus turpis maecenas morbi ac.", 1, '2020-08-17', NULL),
("Felis habitasse vestibulum.", "Ornare scelerisque suspendisse eros aenean curae; dolor litora, iaculis taciti mauris. Integer sem.", 1, '2020-08-26', '2020-12-30'),
("Tellus aliquam arcu.", "Tempor netus donec nec volutpat vivamus eros curabitur? Sed quisque vel hac auctor.", 1, '2020-09-04', NULL);


CREATE TABLE comments (
  comment_id INT AUTO_INCREMENT PRIMARY KEY,
  content TEXT,
  user_id INT NOT NULL REFERENCES users(user_id),
  post_id INT NOT NULL REFERENCES post(post_id),
  created_at DATE DEFAULT NOW(),
  updated_at DATE
);

INSERT INTO comments (content, user_id, post_id, created_at)
VALUES
('Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', 1, 1, '2018-11-05'),
('In hac habitasse platea dictumst. Aliquam augue quam, rutrum at, lorem. Integer tincidunt ante vel ipsum.', 9, 1, '2019-01-27'),
('Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 7, 2, '2019-05-13'),
('Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 5, 2, '2019-05-13'),
('Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. In sit amet, sem.', 4, 2, '2019-05-14'),
('Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.', 7, 2, '2019-05-14'),
('Maecenas rhoncus aliquam lacus. Morbi quis, molestie sed, justo. Pellentesque viverra pede ac diam.', 5, 2, '2019-06-01'),
('Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci. Curabitur in libero ut massa volutpat convallis.', 5, 3, "2019-06-11"),
('Vestibulum ac est lacinia nisi venenatis tristique. Fusce sapien arcu sed augue. Aliquam erat volutpat.', 12, 3, "2019-06-11"),
('Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 2, 3, '2019-06-11'),
('Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.', 7, 3, '2019-06-11'),
('Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus montes, nascetur ridiculus mus. Etiam vel augue.', 5, 3, '2019-06-18'),
('Etiam faucibus cursus urna. Ut tellus.', 6, 3, '2019-07-12'),
('Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat. Aliquam erat volutpat. In congue.', 3, 3, '2019-07-15'),
('Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 4, 4, '2019-09-20'),
('Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.', 8, 4, '2019-10-02'),
('In congue. Etiam justo. Etiam pretium iaculis justo.', 3, 5, '2019-10-21'),
('Nulla neque libero, convallis eget, eleifend luctus, dignissim vel est.', 6, 5, '2019-10-27'),
('Curabitur gravida nisi at nibh.', 4, 5, '2019-11-28'),
('Cras non velit nec nisi vulputate nonummy. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', 10, 2, '2020-01-02'),
('Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, convallis, tortor sapien quis libero.', 8, 8, '2020-02-18'),
('Phasellus sit amet erat.', 2, 8, '2020-02-18'),
('Suspendisse ornare consequat lectus.', 2, 8, '2020-03-04'),
('Integer a nibh. In quis justo.', 10, 6, '2020-03-08'),
('Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.', 8, 6, '2020-03-08'),
('Proin eu mi.', 4, 6, '2020-03-09'),
('Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel sit amet, cursus id, turpis.', 12, 6, '2020-03-12'),
('Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.', 11, 8, '2020-03-24'),
('Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 7, 2, '2020-04-05'),
('Vestibulum quam sapien, varius ut, blandit non, faucibus accumsan odio. Curabitur convallis.', 7, 6, '2020-04-10'),
('Aenean auctor gravida sem.', 9, 9, '2020-08-17'),
('Pellentesque ultrices mattis odio. Donec vitae nisi.', 5, 8, '2020-08-20'),
('Proin eu mi. Nulla ac enim.', 1, 10, '2020-08-27'),
('Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', 6, 10, '2020-08-27'),
('Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Nulla dapibus dolor vel est.', 9, 7, '2020-09-04'),
('Fusce posuere felis sed lacus.', 10, 7, '2020-11-01'),
('Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.', 1, 6,'2020-11-12'),
('Integer non velit.', 3, 7, '2020-11-14');


CREATE TABLE categories (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(42) NOT NULL,
  color VARCHAR(42) DEFAULT "#fff",
  created_at DATE DEFAULT NOW(),
  updated_at DATE
);

INSERT INTO categories (name, color, created_at)
VALUES
("Développement", "#ff0000", '2018-09-02'),
("Lifestyle", "#f54e8f", '2018-09-02'),
('JS', '#ae57c4', '2018-09-02'),
("Cryptos", '#550f8a', '2018-09-02');

CREATE TABLE category_categorize_post (
  category_id INT NOT NULL REFERENCES categories(category_id),
  post_id INT NOT NULL REFERENCES posts(post_id),
  PRIMARY KEY (category_id, post_id),
  created_at DATE DEFAULT NOW(),
  updated_at DATE
);

INSERT INTO category_categorize_post (category_id, post_id, created_at)
VALUES
(2, 1, '2018-09-03'),
(4, 1, '2018-09-03'),
(1, 2, '2019-05-13'),
(2, 3, '2019-06-11'),
(2, 4, '2019-09-17'),
(4, 4, '2019-09-17'),
(2, 5, '2019-10-20'),
(4, 6, '2020-02-18'),
(4, 7, '2020-03-08'),
(2, 8, '2020-08-17'),
(1, 9, '2020-08-26'),
(3, 10, '2020-09-04');

COMMIT;