-- Educational Oracle SQL example: fictional library catalog only.
-- Run once in an empty practice schema.

CREATE TABLE authors (
    author_id NUMBER GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR2(120) NOT NULL,
    CONSTRAINT pk_authors PRIMARY KEY (author_id),
    CONSTRAINT uq_authors_name UNIQUE (full_name)
);

CREATE TABLE books (
    book_id NUMBER GENERATED ALWAYS AS IDENTITY,
    author_id NUMBER NOT NULL,
    title VARCHAR2(200) NOT NULL,
    publication_year NUMBER(4) NOT NULL,
    CONSTRAINT pk_books PRIMARY KEY (book_id),
    CONSTRAINT fk_books_author FOREIGN KEY (author_id) REFERENCES authors(author_id),
    CONSTRAINT ck_books_year CHECK (publication_year BETWEEN 1450 AND 2100)
);

CREATE TABLE loans (
    loan_id NUMBER GENERATED ALWAYS AS IDENTITY,
    book_id NUMBER NOT NULL,
    reader_code VARCHAR2(40) NOT NULL,
    borrowed_on DATE NOT NULL,
    due_on DATE NOT NULL,
    returned_on DATE,
    CONSTRAINT pk_loans PRIMARY KEY (loan_id),
    CONSTRAINT fk_loans_book FOREIGN KEY (book_id) REFERENCES books(book_id),
    CONSTRAINT ck_loans_due CHECK (due_on >= borrowed_on),
    CONSTRAINT ck_loans_returned CHECK (returned_on IS NULL OR returned_on >= borrowed_on)
);
