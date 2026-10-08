# 📦 Inventory Management System

A Java + MySQL inventory management project focused on **relational database design, stock tracking and low-stock monitoring**.

> **Portfolio focus:** Java backend fundamentals, JDBC, SQL schema design, normalization, inventory workflows and data-integrity concepts.

## 🎯 Project goal

The system models a small inventory operation where products are connected to suppliers and categories, while stock movements provide an audit trail for inventory changes.

The database is designed around:

- Product and SKU management
- Supplier relationships
- Product categorization
- Stock quantities and reorder levels
- IN / OUT / ADJUSTMENT movement history
- Foreign-key constraints and indexes for common lookups

## 🗄️ Data model

```text
Suppliers ───────┐
                 ├── Products ──── Stock Movements
Categories ──────┘
```

The SQL schema contains four core tables:

| Table | Purpose |
| --- | --- |
| suppliers | Supplier/company information |
| categories | Normalized product categories |
| products | SKU, stock, price and reorder-level data |
| stock_movements | Inventory movement/audit records |

The products table uses foreign keys to suppliers and categories, while stock_movements references products.

Indexes are defined for SKU and low-stock queries.

## ⚙️ Current implementation

The repository currently contains:

- MySQL database schema
- JDBC database connection class
- Relational constraints and indexes
- Java package structure for the application

The current repository is **not a fully production-ready inventory application** yet. The main implementation currently focuses on the database layer and JDBC connectivity.

## 🧱 Technical architecture

```text
Java application
      ↓
JDBC
      ↓
MySQL
      ↓
Normalized inventory schema
      ↓
Products / Suppliers / Categories / Stock Movements
```

### Technology

- **Java**
- **JDBC**
- **MySQL**
- Relational database design
- SQL constraints and indexing

## 🚀 Database setup

### 1. Create the database

Run:

```bash
mysql -u root -p < database/schema.sql
```

The schema creates the inventory_db database and its tables.

### 2. Configure database credentials

Set these environment variables before running the Java connection test:

```text
DB_URL=jdbc:mysql://localhost:3306/inventory_db
DB_USER=your_mysql_user
DB_PASSWORD=your_mysql_password
```

### 3. Run the connection test

Compile/run the Java application with the **MySQL Connector/J** dependency available on the classpath.

The JDBC connection class is:

```text
src/com/inventory/db/DatabaseConnection.java
```

## 🔐 Security

Database credentials should **never be committed to source control**.

The connection layer reads credentials from environment variables rather than storing a username/password directly in Java source.

## 📈 Useful SQL analytics this schema enables

The schema can support operational queries such as:

- Products below their reorder level
- Current inventory by category
- Stock movement history by product
- Supplier product counts
- Inventory value by category
- Recent stock adjustments
- Products with unusually frequent stock movements

## 🔧 Next improvements

For a stronger end-to-end portfolio project, the next useful additions would be:

1. DAO/repository layer for product, supplier and movement operations
2. CRUD workflows for inventory records
3. Transaction-safe stock IN/OUT operations
4. Automatic reorder alerts
5. Role-based authentication
6. Unit/integration tests
7. Maven or Gradle build configuration
8. Sample seed data and reproducible setup
9. Simple desktop UI or REST API
10. Inventory KPI/reporting layer

## 💼 Portfolio positioning

This is an **older supporting project** in the portfolio rather than the main Data Analytics showcase.

It demonstrates software engineering and relational-database fundamentals that complement the newer Python, SQL, PostgreSQL, ETL, API and analytics projects.

## 👨‍💻 Author

**Sahil Dubey**  
M.Sc. Data Science | Data Analytics | Data Engineering
