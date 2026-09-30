# E-Commerce Database Management & Analytics System

## Project Overview
This repository contains a comprehensive SQL project developed as part of the **DataGrokr Pre-Learning Program (PLP) - Week 4 Assignment**. The project simulates a enterprise-level E-commerce database schema and includes end-to-end relational data modeling, data integrity constraints, data manipulation, and advanced business analytics queries using MySQL.

---

## Technical Stack
- **Database Engine:** MySQL 8.0+
- **Language:** Structured Query Language (SQL)
- **Version Control:** Git & GitHub

---

## Database Architecture & ER Schema
The system models core operational entities of an e-commerce platform using normalized relational tables:

1. **`Categories`**: Stores product classification categories.
2. **`Products`**: Contains product listings with category foreign keys, price checks, and inventory status.
3. **`Customers`**: Stores customer profiles, registration dates, contact details, and location attributes.
4. **`Orders`**: Tracks transaction headers, order dates, fulfillment statuses, and customer mappings.
5. **`OrderItems`**: Line-item level details mapping products to orders with quantity and pricing breakdown.

### Entity Relationships & Constraints Applied
- **Primary Keys & Auto Increment** across all surrogate key identifiers.
- **Foreign Keys with Referential Actions**: `ON DELETE CASCADE` and `ON DELETE SET NULL`.
- **Data Integrity Constraints**: `NOT NULL`, `UNIQUE` emails/categories, and `CHECK` constraints on pricing and order quantities.
- **Schema Alterations**: Applied `ALTER TABLE` commands for field dynamic updates and modified default value specifications.

---

## Key SQL Concepts Demonstrated

- **DDL Operations**: Database creation, table schemas definition, structural alterations, and constraints enforcement.
- **DML Operations**: Complete dataset insertion, updates, and cascading operations.
- **NULL Value Handling**: Usage of `COALESCE`, `NULLIF`, `IS NULL`, and `IS NOT NULL` logic.
- **Aggregations & Grouping**: Complex `GROUP BY` and `HAVING` evaluations across multiple relations.
- **Relational Joins**: `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, and full outer dataset simulation via `UNION`.
- **Built-in Functions**: Comprehensive string manipulations (`UPPER`, `LOWER`, `CONCAT`, `LENGTH`), date/time analytics (`YEAR`, `MONTHNAME`, `DATEDIFF`), and conditional `CASE WHEN` logic.

---

## Analytical Deliverables (35+ Queries)

The main SQL script executes business-critical queries categorized into:

1. **Customer & Order Analysis**: Customer spatial distribution, high-value customer identification, repeat purchase analysis, and geographic revenue aggregation.
2. **Product & Inventory Insights**: Top-selling products, category-wise performance metrics, low stock indicators, and price tier segmentation.
3. **Revenue & Order Trends**: Monthly revenue tracking, completed vs cancelled transaction rates, average order values, and time lapse metrics between orders.
4. **Data Cleansing & Auditing**: Handling incomplete customer profiles, phone record verification, and string case standardizations.

---