# SuiteQL Rules for ODBC and Power BI

## Purpose
Ensure SuiteQL queries are optimized for extraction into tools like Power BI, Excel, and other reporting layers.

SuiteQL should be designed for:
- efficient data extraction
- stable refresh behavior
- downstream modeling flexibility

NOT for:
- presentation formatting
- heavy transformations

---

## 1. Prefer Raw Fields Over Display Fields

### Avoid:
`BUILTIN.DF(TL.Department)`

### Prefer:
`TL.Department`

### Why:
- improves performance
- reduces compute load
- allows cleaner joins in Power BI

---

## 2. Minimize BUILTIN.DF Usage

Use BUILTIN.DF only when:
- absolutely needed for readability
- dataset size is small

Avoid in:
- WHERE clauses
- large datasets
- join logic

---

## 3. Reduce Dataset Size Early

Always filter early in the query:

- transaction type
- date range
- status

### Example:

WHERE
PO.Type = 'PurchOrd'
AND PO.TranDate >= TO_DATE('2025-01-01','YYYY-MM-DD')


---

## 4. Avoid Unnecessary Joins

Each join:
- increases row count
- increases refresh time
- increases memory usage

Only join tables that are required for the output.

---

## 5. Control Grain Explicitly

Define whether your dataset is:

### Line-Level
- one row per transaction line
- requires:
- TL.MainLine = 'F'

### Header-Level
- one row per transaction
- avoid joining TransactionLine unless required

---

## 6. Do Not Mix Header and Line Logic

### Bad Example:
- Transaction.ForeignTotal + TransactionLine join

### Result:
- duplicated totals

### Correct Approach:
- use line-level amounts OR
- aggregate properly

---

## 7. Avoid Heavy Transformations in SuiteQL

Avoid:
- CONCAT
- complex CASE statements
- string formatting

### Why:
- slows extraction
- harder to maintain
- better handled in Power BI

---

## 8. Use Consistent Keys for Joins

Prefer:
- internal IDs

Avoid:
- display names

### Example:
- TL.Entity = Job.ID

- Not: BUILTIN.DF(TL.Entity)


---

## 9. Design for Power BI Model Layer

SuiteQL should:
- return clean, structured data
- avoid business logic where possible

Push logic to:
- Power Query
- DAX measures

---

## 10. Keep Queries Simple

Better:
- smaller datasets
- simpler logic

Avoid:
- overly complex single queries

---

## 11. Incremental Design Approach

Best practice:

1. Base Query (SuiteQL)
   - raw data
   - minimal logic

2. Power Query
   - transformations
   - shaping

3. DAX
   - calculations
   - KPIs

---

## 12. Performance Red Flags

Watch for:

- heavy BUILTIN.DF usage
- no date filters
- unnecessary joins
- large text fields
- complex CASE logic

---

## 13. ODBC-Specific Considerations

- Queries may behave differently vs NetSuite UI
- Large datasets may timeout
- Some functions may not perform well

### Best Practice:
- test in ODBC environment
- simplify if performance issues occur

---

## 14. Column Selection

Only select what you need.

Avoid: SELECT *


---

## 15. Naming Conventions

Use clear, consistent aliases:

PO.TranID AS PurchaseOrderNumber

---

## Key Principle

Design SuiteQL for extraction and performance.

Let Power BI handle presentation and business logic.
