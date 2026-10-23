package demo.catalog;

import java.util.List;

/** Dependency-free checks runnable directly with java. */
public final class CatalogSelfTest {
    private CatalogSelfTest() {}

    public static void main(String[] args) {
        Catalog catalog = new Catalog();
        Book a = new Book(3, "Clean Code Examples", "A. Writer", 2021);
        Book b = new Book(1, "Java Patterns", "B. Writer", 2018);
        Book c = new Book(2, "Java Testing", "C. Writer", 2018);
        catalog.add(a);
        catalog.add(b);
        catalog.add(c);
        expect(catalog.size() == 3, "count");
        expect(catalog.findTitle("java").equals(List.of(b, c)), "case-insensitive title search");
        expect(catalog.sortedByYear().equals(List.of(b, c, a)), "stable ordering");
        expectThrows(() -> catalog.add(a), "duplicate ID");
        expectThrows(() -> new Book(0, "x", "y", 2000), "invalid ID");
        expectThrows(() -> new Book(4, " ", "y", 2000), "blank title");
        expectThrows(() -> catalog.findTitle("  "), "blank query");
        System.out.println("Catalog checks passed");
    }

    private static void expect(boolean condition, String label) {
        if (!condition) throw new AssertionError(label);
    }

    private static void expectThrows(Runnable action, String label) {
        try { action.run(); } catch (IllegalArgumentException expected) { return; }
        throw new AssertionError("Expected failure: " + label);
    }
}
