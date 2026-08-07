# Relational Database & Automation System

An automated inventory and transaction logging database system built with PostgreSQL, featuring automated stock deduction and relational query tracking.

## Core Features
- **Relational Schema:** Designed tables with foreign key relationships, check constraints, and indexed primary keys.
- **Automated Inventory Deduction:** Utilizes PL/pgSQL stored procedures and triggers to subtract stock upon transaction logging.
- **Relational Reporting:** Multi-table `JOIN` queries for operational auditing.
## Purpose & Overview
In standard inventory systems, updating stock counts manually through client applications can lead to data inconsistencies and race conditions. This project offloads business logic directly to the database layer by automating record updates whenever a transaction is logged.
## Tech Stack
- PostgreSQL
- PL/pgSQL
- SQL
