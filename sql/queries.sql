-- Example: books with author information, ordered deterministically.
SELECT b.book_id, b.title, a.full_name AS author_name, b.publication_year
FROM books b
JOIN authors a ON a.author_id = b.author_id
ORDER BY b.publication_year, b.book_id;

-- Example: number of books per author, including authors with no books.
SELECT a.author_id, a.full_name, COUNT(b.book_id) AS book_count
FROM authors a
LEFT JOIN books b ON b.author_id = a.author_id
GROUP BY a.author_id, a.full_name
ORDER BY book_count DESC, a.full_name;

-- Example: outstanding loans (if loan data has been added).
SELECT l.loan_id, b.title, l.due_on
FROM loans l
JOIN books b ON b.book_id = l.book_id
WHERE l.returned_on IS NULL
ORDER BY l.due_on, l.loan_id;
