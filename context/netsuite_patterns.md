# NetSuite SuiteQL Patterns

This file contains proven query patterns from this NetSuite instance. Use these patterns as the first reference point when designing, writing, or debugging SuiteQL.

## Core Principles

- Prefer patterns already proven in this environment over theoretical alternatives.
- Preserve working joins unless there is a clear reason to change them.
- Be careful with header vs line grain.
- Be careful with one-to-many joins that can duplicate rows.
- Use `BUILTIN.DF(...)` for readable output fields, but avoid excessive use in filters when raw fields are more reliable or performant.
- For line-level transaction detail, commonly use:
  - `Transaction` joined to `TransactionLine`
  - `TransactionLine.MainLine = 'F'`
  - `TransactionLine.TaxLine = 'F'` when needed
- For tracing document relationships:
  - Use `PreviousTransactionLineLink` for backward tracing
  - Use `NextTransactionLineLink` for forward tracing
- For shipping address fields:
  - Prefer `TransactionShippingAddress` via `Transaction.ShippingAddress = TransactionShippingAddress.nkey`
  - Do not assume header shipping fields are exposed directly on `Transaction`

---

## Pattern 1: Invoice Sales Team Revenue by Employee

### Purpose
Returns invoice line detail by sales team employee, including revenue, estimated cost, and gross profit.

### Proven Tables
- `transactionSalesTeam`
- `Transaction`
- `TransactionLine`

### Proven Join Pattern
- `transactionSalesTeam.transaction = Transaction.id`
- `TransactionLine.Transaction = Transaction.ID`

### Proven Filters
- `BUILTIN.DF(T.type) = 'Invoice'`
- `TL.mainLine = 'F'`
- `TL.taxLine = 'F'`
- `TST.contribution IN (0, 1)`

### Query
```sql
SELECT
    BUILTIN.DF(tst.employee),
    T.ID,
    T.TranDate,
    BUILTIN.DF(T.Type) AS Type,
    T.TranID,
    REPLACE(BUILTIN.DF(T.Status), BUILTIN.DF(T.Type) || ' : ', '') AS Status,
    T.ForeignTotal,
    TL.rateamount,
    BUILTIN.DF(TL.class) AS Class,
    TL.memo,
    concat(t.tranid, concat(' ', tl.memo)),
    -TL.foreignamount AS Rev,
    -TL.costestimate AS Cost,
    (-TL.foreignamount + TL.costestimate) AS GP,
    TL.itemtype,
    TST.contribution
FROM transactionSalesTeam TST
INNER JOIN Transaction T
    ON TST.transaction = T.id
INNER JOIN TransactionLine TL
    ON TL.Transaction = T.ID
WHERE
    TST.contribution IN (0, 1)
    AND BUILTIN.DF(T.type) = 'Invoice'
    AND T.trandate >= TO_DATE('2026-02-01', 'YYYY-MM-DD')
    AND TL.mainLine = 'F'
    AND TL.taxLine = 'F'
    AND BUILTIN.DF(tst.employee) NOT IN ('Jacob Farmer', 'Scott McMicken', 'Zach R Blaylock')
    AND BUILTIN.DF(TL.Department) = 'Parts'
ORDER BY
    BUILTIN.DF(tst.employee)