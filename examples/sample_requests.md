
# Sample SuiteQL Requests

Use these to test and refine the system.

---

## Basic Query

Show me open purchase orders with:
- vendor
- department
- job
- expected receipt date

---

## Sales Reporting

Show invoice revenue by:
- sales rep
- month
- department

Exclude internal employees.

---

## Backlog

Show backlog sold but not shipped:
- open purchase orders
- quantity not billed
- grouped by department

---

## Reconciliation

Find mismatches between:
- PO ship state
- SO ship state
- Estimate ship state

---

## Job-Based Reporting

Show all transactions tied to a job:
- revenue
- cost
- gross profit

---

## Advanced

Show projects sold and shipped:
- PO
- vendor bill
- department mapped to division
- job

---

## Debug Request Example

This query is duplicating rows and totals are too high:

[paste query]

---

## Error Debug Example

This query throws NOT_EXPOSED error:

[paste query]