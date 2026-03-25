# Known NetSuite SuiteQL Issues

This file captures real issues encountered in this NetSuite environment.

---

## 1. Shipping Fields Not Exposed

### Issue
Fields like:
- Transaction.shipstate
- Transaction.shipcity

Are not exposed.

### Solution
Use:
TransactionShippingAddress

---

## 2. Duplicate Rows from Link Tables

### Issue
Joining:
- TransactionLine
- NextTransactionLineLink
- PreviousTransactionLineLink

Can create duplicates.

### Solution
- Confirm grain first
- Expect one-to-many relationships
- Do not blindly GROUP BY

---

## 3. Header vs Line Confusion

### Issue
Using:
- Transaction totals with line joins

### Result
Incorrect totals

### Solution
- Use line amounts OR aggregate correctly

---

## 4. Status Inconsistency

### Issue
Status can behave differently:
- raw status codes
- display values via BUILTIN.DF

### Solution
Be consistent within query

---

## 5. Job Join Behavior

### Issue
Job linkage depends on:
TransactionLine.entity

### Solution
Use:
```sql
LEFT JOIN job j ON TL.entity = j.id