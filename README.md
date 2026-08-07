# Relational Database & Automation System

A relational database management system designed to track inventory, borrowers, and transaction logs with automated stock deduction logic.

## Purpose & Overview
In standard inventory systems, updating stock counts manually through client applications can lead to data inconsistencies and race conditions. This project offloads business logic directly to the database layer by automating record updates whenever a transaction is logged.

## Prerequisites
- **Database Engine:** PostgreSQL 15.0 or higher (or MySQL 8.0+)
- **Database Client:** `psql` CLI, pgAdmin 4, VS Code with PostgreSQL extension, or an online runner like DB Fiddle
- **Environment:** Windows, macOS, or Linux

## Key Technical Features
- **Relational Integrity:** Multi-table schema design enforced with primary keys, foreign keys, and non-negative check constraints.
- **Automated Triggers:** Custom PL/pgSQL function and event trigger (`AFTER INSERT`) that automatically decrements stock count when an issue log is recorded.
- **Auditing & Reporting:** Multi-table `JOIN` queries connecting user records, inventory, and issue timestamps.

## Tech Stack
- **Database Engine:** PostgreSQL
- **Procedural Language:** PL/pgSQL
- **Language:** SQL

## Database Schema & Logic
- **`Books` Table:** Tracks `book_id`, `title`, `author`, and `copies_available`.
- **`Borrowers` Table:** Tracks `borrower_id`, `name`, and `email`.
- **`IssueLog` Table:** Records transactions connecting borrowers to books.
- **Trigger (`trigger_book_issued`):** Fires automatically on new log insertion to subtract 1 from available copies.

## How to Run
1. Open your PostgreSQL client (`psql`, pgAdmin, or DB Fiddle).
2. Copy and execute the contents of `library_system.sql`.
3. Verify output to confirm stock reduction from 5 to 4 copies.
