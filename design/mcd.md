# MCD

En informatique, MCD est une abréviation qui signifie modèle conceptuel de données, il s'agit d'une représentation logique de l'organisation des informations et de leurs relations.

## Entités

L'entité est définie comme un objet de gestion considéré d'intérêt pour représenter l'activité à modéliser (exemple : entité pays). À son tour, chaque entité (ou objet) est porteuse d'une ou plusieurs propriétés simples, dites atomiques (exemples : code, nom, capitale, population, superficie) dont l'une, unique et discriminante, est désignée comme identifiant (exemple : code).

Users, Comments, Posts, Categories

## Cardinalités

Les cardinalités permettent de caractériser le lien qui existe entre une entité et la relation à laquelle elle est reliée.
La cardinalité d'une relation est composée d'un couple comportant une borne maximale et une borne minimale, intervalle dans
lequel la cardinalité d'une entité peut prendre sa valeur :

- la borne minimale (généralement 0 ou 1) décrit le nombre minimum de fois qu'une entité peut participer à une
  relation

- la borne maximale (généralement 1 ou n) décrit le nombre maximum de fois qu'une entité peut participer à une relation

---

- un utilisateur peut écrire plusieurs posts - un post peut être écrit par un seul utilisateur
  - --> 0N Users, 11 Posts
- un utilisateur peut avoir écrit zéro ou plusieurs commentaires - un commentaire peut avoir été écrit par un seul utilisateur
  - --> 0N Users, 11 Comments
- un post peut avoir été commenté plusieurs fois - un commentaire ne peut être présent que sur un post
  - --> 0N Posts, 11 Comments
- un post peut avoir une ou plusieurs catégories - une catégorie peut être présente sur 0 ou plusieurs posts
  - --> 0N Categories, 1N Posts

## MoCoDo

Users: first_name, last_name, username, email, password, is_admin
Comment, 0N Users, 11 Comments
Comments: content

Write, 0N Users, 11 Posts
Posts: title, content
Belongs_To, 11 Comments, 0N Posts

:
Categorize, 0N Categories, 1N Posts
Categories: name, color

## MoCoDo full

Users: user_id, first_name, last_name, username, email, password, is_admin, created_at, updated_at
Comment, 0N Users, 11 Comments
Comments: comment_id, content, *user_id, *post_id, created_at, updated_at

Write, 0N Users, 11 Posts
Posts: post_id, title, content, \*user_id, created_at, updated_at
Belongs_To, 11 Comments, 0N Posts

:
Categorize, 0N Categories, 1N Posts: *category_id, *post_id, created_at, updated_at
Categories: category_id, name, color, created_at, updated_at
