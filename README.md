# saas-churn-analytics-sql

# RavenStack SaaS Analytics | SQL Business Case Study

## Project Overview

This project is an end-to-end SQL analytics case study built around a synthetic SaaS company, **RavenStack**. The objective is to analyze customer acquisition, subscription revenue, and churn behavior to uncover business insights that can support data-driven decision making.

Using relational SQL queries, the project investigates how customers are acquired, which segments generate the highest recurring revenue, and what factors contribute to customer churn.

The analyses are designed to simulate real-world business questions commonly addressed by Product Analytics, Growth Analytics, Customer Success, and Business Intelligence teams.

---
## Dataset Source: Kaggle

## Business Objectives

This project answers key business questions across multiple functional areas:

### Customer Acquisition Analytics

- Identify the highest-performing referral sources.
- Analyze monthly customer acquisition trends.
- Measure month-over-month signup growth.
- Compare customer quality across acquisition channels.
- Evaluate ARR contribution by referral source.
- Analyze customer distribution across countries and industries.

### Revenue & Subscription Analytics

- Evaluate Annual Recurring Revenue (ARR) by subscription plan.
- Measure revenue generated per licensed seat.
- Compare monthly and annual subscription performance.
- Identify the highest revenue-generating customers.
- Rank subscription plans using multiple revenue KPIs.

### Customer Retention & Churn Analytics

- Calculate overall customer churn rate.
- Measure churn across industries.
- Compare churn by referral source.
- Analyze churn across customer size segments.
- Evaluate the impact of subscription upgrades and downgrades.
- Quantify Annual Recurring Revenue lost due to customer churn.

---

## Dataset

The project uses a fully synthetic SaaS dataset consisting of five relational tables.

| Table | Description |
|--------|-------------|
| `ravenstack_accounts` | Customer account information |
| `ravenstack_subscriptions` | Subscription lifecycle and recurring revenue |
| `ravenstack_feature_usage` | Product usage events |
| `ravenstack_support_tickets` | Customer support interactions |
| `ravenstack_churn_events` | Customer churn history |

### Database Relationships

```
Accounts
    │
    ├────────────── Subscriptions
    │                     │
    │                     └──────── Feature Usage
    │
    ├────────────── Support Tickets
    │
    └────────────── Churn Events
```

---

## SQL Concepts Demonstrated

This project applies a wide range of SQL techniques including:

- Joins
- Common Table Expressions (CTEs)
- Window Functions
- Ranking Functions
- Aggregate Functions
- Conditional Aggregation
- CASE Expressions
- Date Functions
- GROUP BY
- ORDER BY
- Business KPI Calculations

Window functions used include:

- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- LAG()

---

## Business Questions Solved

### Customer Acquisition Analytics

- Which referral source acquires the most customers?
- Which referral source generates the highest ARR?
- Which referral source brings the highest-value customers?
- How many customers signed up each month?
- What is the month-over-month signup growth?
- Which countries generate the highest ARR per customer?

### Revenue Analytics

- Which subscription plans contribute the highest ARR?
- Which plans generate the highest revenue per licensed seat?
- Who are the top revenue-generating customers?
- Which industries contain the highest ARR customers?
- Revenue Performance Scorecard by subscription plan.

### Customer Retention & Churn Analytics

- Overall customer churn rate
- Churn by industry
- Churn by referral source
- Churn by customer size
- Upgrade vs downgrade churn analysis
- Revenue lost due to customer churn

---

## Key Business KPIs

- Customer Acquisition
- Annual Recurring Revenue (ARR)
- Monthly Recurring Revenue (MRR)
- Revenue per Seat
- Customer Churn Rate
- ARR Lost due to Churn
- Customer Growth Rate
- Customer Value by Acquisition Channel

---

## Tools Used

- MySQL 8
- SQL
- MySQL Workbench

---

## Skills Demonstrated

- Business Analytics
- Product Analytics
- SaaS Metrics
- Customer Analytics
- Revenue Analytics
- Churn Analytics
- SQL Query Optimization
- Data Exploration
- KPI Development
- Analytical Problem Solving

---

## Repository Structure

```
RavenStack-SaaS-Analytics
│
├── Dataset
│
├── SQL Queries
│   ├── Customer Acquisition Analytics.sql
│   ├── Revenue & Subscription Analytics.sql
│   ├── Customer Retention & Churn Analytics.sql
│
├── README.md
│
└── LICENSE
```

---

## About the Dataset

The dataset is completely synthetic and was generated to simulate realistic SaaS business operations, including customer acquisition, subscription billing, product usage, customer support interactions, and churn events.

The data maintains referential integrity across all relational tables while preserving realistic business scenarios.

---
