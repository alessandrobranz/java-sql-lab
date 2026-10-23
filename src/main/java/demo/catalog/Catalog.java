package demo.catalog;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

/** In-memory example of deterministic catalog behavior. */
public final class Catalog {
    private final Map<Long, Book> books = new TreeMap<>();

    public void add(Book book) {
        if (book == null) throw new IllegalArgumentException("book is required");
        if (books.putIfAbsent(book.id(), book) != null)
            throw new IllegalArgumentException("duplicate book id: " + book.id());
    }

    public List<Book> findTitle(String query) {
        if (query == null || query.isBlank()) throw new IllegalArgumentException("query is required");
        String normalized = query.trim().toLowerCase(Locale.ROOT);
        return books.values().stream()
            .filter(book -> book.title().toLowerCase(Locale.ROOT).contains(normalized))
            .toList();
    }

    public List<Book> sortedByYear() {
        List<Book> result = new ArrayList<>(books.values());
        result.sort(Comparator.comparingInt(Book::publicationYear).thenComparingLong(Book::id));
        return List.copyOf(result);
    }

    public int size() {
        return books.size();
    }
}
