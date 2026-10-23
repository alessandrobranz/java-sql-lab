package demo.catalog;

public final class Main {
    private Main() {}

    public static void main(String[] args) {
        Catalog catalog = new Catalog();
        catalog.add(new Book(101, "Algorithms in Practice", "Morgan Lee", 2019));
        catalog.add(new Book(102, "Software Design Notes", "Alex Rivera", 2022));
        catalog.add(new Book(103, "The Art of Debugging", "Taylor Kim", 2021));
        System.out.println("Books: " + catalog.size());
        for (Book book : catalog.sortedByYear()) {
            System.out.printf("%d | %d | %s%n", book.id(), book.publicationYear(), book.title());
        }
    }
}
