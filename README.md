# Bookmark Manager

This is part of Maker's week 4 course (specifically, the database week).

User Stories
------------

```
As a user
I would like to 
view a list of my bookmarks
```
Domain Model
-------------

[![1.png](https://i.postimg.cc/NFNLWWmH/1.png)](https://postimg.cc/ZvdTNsfb)

Database Setup
---------------

1. Connect to psql
2. Create the database using the psql command `CREATE DATABASE bookmark_manager;`
3. Connect to the database using the `pqsl` command `\c bookmark_manager;`
4. Run the query we have saved in the file `01_create_bookmarks_table.sql`

**Test Database Setup**

```
$> psql
admin=# CREATE DATABASE "bookmark_manager_test";
admin=# CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));
```

