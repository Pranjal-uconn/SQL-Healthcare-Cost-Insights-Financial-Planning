# 🏥 Healthcare & Insurance SQL Management System

## 📌 Description  
This project is a complete Healthcare & Insurance SQL Management System, designed to simulate and analyze key operations in a healthcare environment including patient onboarding, insurance processing, claims tracking, provider engagement, and service usage.

Built using PostgreSQL, the system is modeled on synthetic healthcare data. The database includes fully normalized schema, referential integrity, indexing, and is built to support advanced reporting and analysis.

---

## 🔑 Key Features

- **Entity Relationship Modeling**: ERD was the foundational design step, capturing complex relationships between patients, insurance, claims, services, and providers.
- **Relational Schema**: Implemented using SQL DDL with primary/foreign keys, constraints, and indexed fields for performance.
- **Synthetic Healthcare Data**: Populated using realistic synthetic data for testing and analysis.
- **Advanced SQL Reporting**: Showcases complex reporting logic using multiple joins, subqueries, aggregations, and window functions.

---

## 📂 Repository Contents

- `DDL.sql` – Defines all tables, relationships, and indexes.
- `DML.sql` – Inserts realistic sample data into the system.
- `ERD.png` – The entity-relationship diagram that visually represents the schema.
- `reports.sql` – A curated set of advanced analytical SQL queries that showcase real-world use cases.
- `README.md` – Project documentation.

---

## 🔗 ERD Overview

### Key Entities:
- `Patients`
- `Patient_Insurance`
- `Insurance Plans`
- `Claims and Payments`
- `Services`
- `Healthcare Providers`
- `Feedback and Complaints`

### Key Relationships:
- One-to-many between `Patients` and `Claims`
- Many-to-one from `Claims` to `Insurance Plans`
- One-to-many from `Providers` to `Services`
- Many-to-many simulated via junction tables

---

## 🧪 How I Built It

1. Generated synthetic healthcare and insurance data
2. Designed the ERD to model patients, claims, services, insurance, and providers
3. Created DDL scripts with all necessary keys, constraints, and indexing
4. Populated the schema using DML scripts with realistic values
5. Ran complex SQL reports to validate the schema, extract insights, and showcase SQL proficiency

---

## 🧾 Use Cases

This project is ideal for:

- Practicing advanced SQL with real-world schema design
- Simulating healthcare analytics pipelines
- Preparing for SQL-heavy data analyst or BI engineer interviews
- Demonstrating data modeling and reporting in technical portfolios
