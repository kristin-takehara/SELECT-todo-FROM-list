\c KRISTINTAKEHARA;

-- 1. Write a query to drop a database named `todo_app` if it exists

DROP DATABASE IF EXISTS todo_app;

-- 1. Write a query to delete a user named `michael` if it exists

DROP USER IF EXISTS michael;

-- 1. Write a query to create a user named `michael` with an encrypted password `stonebreaker`

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

-- 1. Write a query to create a database named `todo_app`

CREATE DATABASE todo_app;

-- 1. Connect to the newly created database

\c todo_app;

-- 1. Write a query to create a table named `tasks` using the **Initial columns** detailed below

-- 1. Define column `id` as the table's primary key

CREATE TABLE tasks (
id SERIAL NOT NULL PRIMARY KEY,
title VARCHAR(255) NOT NULL DEFAULT false,
description TEXT NOT NULL DEFAULT true,
created_at TIMESTAMP DEFAULT NOW(),
updated_at TIMESTAMP NULL,
completed BOOLEAN NOT NULL DEFAULT false
);

-- 1. Write queries to accomplish the following:
--   1. remove the column named `completed`

ALTER TABLE tasks
DROP COLUMN completed;

--   1. add a column to `tasks` named `completed_at`:timestamp, that may be NULL, and has a default value of `NULL`.

ALTER TABLE tasks
ADD COLUMN completed_at TIMESTAMP NULL;

--   1. change the `updated_at` column to not allow NULL values, and have a default value of `now()`

ALTER TABLE tasks
ALTER COLUMN updated_at
SET NOT NULL,
ALTER COLUMN updated_at
SET DEFAULT NOW();

--   1. create a new task, by only setting values (not defining which columns)
--   `id = default value`
--   `title = 'Study SQL'`
--   `description = 'Complete this exercise'`
--   `created_at = now()`
--   `updated_at = now()`
--   `completed_at = NULL`

INSERT INTO tasks
VALUES (DEFAULT, 'Study SQL', 'Complete this exercise', now(), now(), NULL);

--   1. create a new task
--   `title = 'Study PostgreSQL'`
--   `description = 'Read all the documentation'`

INSERT INTO tasks (title, description)
VALUES ('Study PostgreSQL', 'Read all the documentation');

--   1. select all the titles of tasks that are not yet completed

SELECT title
FROM tasks
WHERE NULL;

--   1. update the task with a title of `'Study SQL'` to be completed as of now

INSERT INTO tasks (title)
VALUES ('Study SQL');

--   1. select all titles and descriptions of tasks that are not yet completed

SELECT title
FROM tasks
WHERE NULL;

SELECT description
FROM tasks
WHERE NULL;

--   1. select all fields of every task sorted by creation date in descending order

SELECT *
FROM tasks
ORDER BY created_at DESC;

--   1. create a new task
--   `title = 'mistake 1'`
--   `description = 'a test entry'`

INSERT INTO tasks (title, description)
VALUES('mistake 1', 'a test entry');

--   1. create a new task
--   `title = 'mistake 2'`
--   `description = 'another test entry'`

INSERT INTO tasks (title, description)
VALUES ('mistake 2', 'another test entry');

--   1. create a new task
--   `title = 'third mistake'`
--   `description = 'another test entry'`

INSERT INTO tasks (title, description)
VALUES ('third mistake', 'another test entry');

--   1. select title fields of all tasks with a title that includes the word `'mistake'`

SELECT *
FROM tasks
WHERE title LIKE %mistake%;

--   1. delete the task that has a title of `mistake 1`

DELETE FROM tasks
WHERE title LIKE %mistake 1%;

--   1. select title and description fields of all tasks with a title that includes the word `'mistake'`

SELECT *
FROM tasks
WHERE title LIKE %mistake%;

--   1. delete all tasks that includes the word `'mistake'` in the title

DELETE FROM tasks
WHERE title %mistake%;

--   1. select all fields of all tasks sorted by `title` in ascending order

SELECT *
FROM tasks
ORDER BY title ASC;