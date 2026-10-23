# Java & SQL Lab — Library Catalog

An independent engineering example built around a **fictional book library**. It demonstrates core Java design, validation, deterministic behavior and Oracle-style relational SQL/PLSQL.

**No professional datasets, employer code or workplace business processes are involved.**

## What's included

- Small **Java 17** catalog model using records, collections, validation and predictable ordering
- Dependency-free automated checks for common cases and invalid input
- Example **Oracle SQL** schema with primary keys, foreign keys and constraints
- Synthetic seed data, joined reporting queries and a PL/SQL stored procedure

## Run the Java example

With JDK 17 or newer, from the repository root:

```sh
mkdir -p build/classes
javac -d build/classes src/main/java/demo/catalog/*.java src/test/java/demo/catalog/*.java
java -cp build/classes demo.catalog.Main
java -cp build/classes demo.catalog.CatalogSelfTest
```

Expected test output: `Catalog checks passed`.

GitHub Actions compiles and executes the Java checks.

## SQL examples

| File | Purpose |
|---|---|
| [schema.sql](sql/schema.sql) | Minimal book library relational schema |
| [seed.sql](sql/seed.sql) | Invented authors and books |
| [queries.sql](sql/queries.sql) | Joins, aggregation and ordering |
| [return_book.sql](sql/return_book.sql) | PL/SQL example for closing an existing loan |

The SQL is written for **Oracle Database** syntax and is illustrative. It has not been run against a live Oracle instance in this portfolio.

## Design boundaries

This is a learning and demonstration project, not a production circulation platform. It does not include authentication, concurrent lending management, database drivers, external services or personal data.

No open-source license for redistribution has been granted.
