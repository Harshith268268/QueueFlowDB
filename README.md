# QueueFlowDB

A database engineering project for designing and implementing a queue-based database system using **Microsoft SQL Server**.

## 1. Project Overview

QueueFlowDB is designed to manage customer service requests and route them to suitable agents based on their skills and availability.

The database maintains customer details, agent information, agent skills, service requests, and routing decisions.

## 2. Technology Stack

- **Database:** Microsoft SQL Server
- **Query Language:** SQL
- **IDE:** Visual Studio Code, SQL Server Management Studio
- **Version Control:** Git and GitHub
- **Project Management:** Jira

## 3. Database Design

The database contains six tables:

| Table | Purpose |
|---|---|
| Customer | Stores customer information |
| Agent | Stores agent details and availability |
| Skill | Stores available service skills |
| AgentSkill | Maps agents to their skills |
| Request | Stores customer service requests |
| RoutingDecision | Records agent assignment decisions |

### Entity Relationship Diagram

The ER diagram is available at:

`docs/er-diagram.md`

It describes the entities, attributes, primary keys, foreign keys, and relationships in the database.

## 4. Project Structure

```text
QueueFlowDB/
│
├── docs/
│   └── er-diagram.md
│
├── sql/
│   ├── 01_schema.sql
│   ├── 02_sample_data.sql
│   └── 03_verify_database.sql
│
├── mongodb/
│
├── src/
│
├── tests/
│
├── .gitignore
└── README.md
```

## 5. Database Setup and Execution

Follow these steps to create and verify the database.

### Step 1: Create the database and tables

Open SQL Server Management Studio and execute:

`sql/01_schema.sql`

This script creates the `QueueFlowDB` database and all six tables with their constraints and relationships.

### Step 2: Insert sample data

Execute:

`sql/02_sample_data.sql`

This script inserts sample records into the database tables.

### Step 3: Verify the database

Execute:

`sql/03_verify_database.sql`

This script checks:
- Table creation
- Primary key constraints
- Foreign key constraints
- Other defined constraints
- Record counts in all six tables

## 6. Verification Results

The database was successfully created and verified.

Sample records inserted:

| Table | Records |
|---|---:|
| Customer | 5 |
| Agent | 4 |
| Skill | 4 |
| AgentSkill | 7 |
| Request | 5 |
| RoutingDecision | 3 |
| **Total** | **28** |

All six tables were verified using SQL Server system information views.

## 7. Project Management

The project uses Agile Scrum methodology with Jira for sprint planning and task tracking.

### Sprint 1 Tasks

1. Set up repository and project structure.
2. Design the ER diagram.
3. Write SQL DDL scripts for all six tables.
4. Insert sample data into all tables.
5. Verify schema and constraints.
6. Complete Sprint 1 review and documentation.

## 8. Repository

GitHub: https://github.com/Harshith268268/QueueFlowDB

---

**Project:** QueueFlowDB  
**Sprint:** Sprint 1 – Database  
**Status:** SQL database implementation and verification completed.