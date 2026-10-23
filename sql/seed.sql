-- Fictional books and authors; run after schema.sql.
INSERT INTO authors (full_name) VALUES ('Morgan Lee');
INSERT INTO authors (full_name) VALUES ('Alex Rivera');
INSERT INTO authors (full_name) VALUES ('Taylor Kim');

INSERT INTO books (author_id, title, publication_year)
SELECT author_id, 'Algorithms in Practice', 2019
FROM authors WHERE full_name = 'Morgan Lee';

INSERT INTO books (author_id, title, publication_year)
SELECT author_id, 'Software Design Notes', 2022
FROM authors WHERE full_name = 'Alex Rivera';

INSERT INTO books (author_id, title, publication_year)
SELECT author_id, 'The Art of Debugging', 2021
FROM authors WHERE full_name = 'Taylor Kim';

COMMIT;
