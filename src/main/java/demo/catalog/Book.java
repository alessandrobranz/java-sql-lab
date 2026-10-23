package demo.catalog;

/** Minimal immutable library book record; no external data sources. */
public record Book(long id, String title, String author, int publicationYear) {
    public Book {
        if (id <= 0) throw new IllegalArgumentException("id must be positive");
        if (title == null || title.isBlank()) throw new IllegalArgumentException("title is required");
        if (author == null || author.isBlank()) throw new IllegalArgumentException("author is required");
        if (publicationYear < 1450 || publicationYear > 2100)
            throw new IllegalArgumentException("publication year is out of range");
        title = title.trim();
        author = author.trim();
    }
}
