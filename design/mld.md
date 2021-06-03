# MLD

Users, Posts, Comments, Categories

- --> 0N Users, 11 Posts
- --> 0N Users, 11 Comments
- --> 0N Posts, 11 Comments
- --> 0N Categories, 1N Posts

---

- users : user_id (PK), first_name, last_name, username, email, password, is_admin, created_at, updated_at

- posts : post_id (PK), title, content, user_id (FK), created_at, updated_at

- comments : comment_id (PK), content, user_id(FK), post_id(FK), created_at, updated_at

- categories : category_id(PK), name, color, created_at, updated_at

- category_belongs_to_post : category_id (PK), post_id(PK), created_at, updated_at
