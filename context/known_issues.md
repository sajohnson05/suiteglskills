# Known NetSuite SuiteQL Issues

## Purpose
This file captures recurring issues observed in this NetSuite environment and related reporting workflows.

Each issue is tagged by severity so skills can treat it appropriately.

Severity levels:
- CRITICAL = can silently produce wrong totals or wrong business conclusions
- WARNING = may return incomplete, misleading, or unstable output
- INFO = low-risk, cosmetic, or situational behavior

---

## [CRITICAL] Header vs Line Confusion

### Issue
Using transaction header totals together with line joins can inflate totals or create mathematically incorrect output.

### Common Example
- using `Transaction.ForeignTotal` in a query joined to `TransactionLine`

### Risk
Query may run successfully but return wrong totals.

### Guidance
- reconcile header-to-header
- or aggregate line amounts correctly before comparing to header totals

---

## [CRITICAL] Duplicate Rows from Link Tables

### Issue
Joining:
- `TransactionLine`
- `PreviousTransactionLineLink`
- `NextTransactionLineLink`

can multiply rows unexpectedly.

### Risk
Revenue, cost, billed amount, or counts may be overstated without obvious errors.

### Guidance
- confirm intended grain first
- explain one-to-many relationships
- do not use `GROUP BY` as a blind fix

---

## [CRITICAL] Environment-Specific Local Logic

### Issue
Business-specific mappings and assumptions may drift from reality over time.

### Risk
Queries may produce technically valid but business-wrong output.

### Guidance
- review `context/customizations.md` whenever local logic changes
- do not assume local mappings remain current indefinitely

---

## [WARNING] Shipping Fields Not Exposed Directly

### Issue
Fields like:
- `Transaction.shipstate`
- `Transaction.shipcity`

may not be exposed directly.

### Risk
Query may fail or return incomplete logic if direct fields are assumed.

### Guidance
Use:
- `TransactionShippingAddress`

with the proven join pattern.

---

## [WARNING] Status Inconsistency

### Issue
Status logic may differ between:
- raw status codes
- `BUILTIN.DF(...)` display values
- saved search logic
- report logic

### Risk
Totals may not tie even when the query is otherwise correct.

### Guidance
- state status logic explicitly
- keep status method consistent within a query
- compare against source report logic before assuming error

---

## [WARNING] ODBC Differences

### Issue
Queries that behave acceptably in one environment may behave differently in ODBC or reporting extraction contexts.

### Risk
Slow refreshes, timeout issues, or unexpected output shape.

### Guidance
- use `context/odbc_powerbi_rules.md`
- simplify extraction queries
- minimize heavy transformations

---

## [WARNING] Date Basis Mismatch

### Issue
Different reports or saved searches may use different date fields.

### Risk
Totals may not tie for valid reasons.

### Guidance
State clearly whether the query is using:
- transaction date
- posting date
- due date
- last modified date
- expected receipt date

---

## [INFO] Job Join Behavior

### Issue
Job linkage in this environment often depends on:
- `TransactionLine.entity = job.id`

### Guidance
Treat this as a strong local pattern, but validate if the use case changes significantly.

---

## [INFO] BUILTIN.DF Performance Impact

### Issue
Heavy use of `BUILTIN.DF(...)` can slow queries.

### Guidance
Prefer raw fields where practical, especially for large extraction queries.

---

## How Skills Should Use This File

- `CRITICAL` issues should trigger an automatic warning when relevant
- `WARNING` issues should be surfaced in watchouts
- `INFO` issues can remain informational unless directly relevant

---

## Key Principle

A query that runs is not necessarily a query that is safe.

Known issues should be used to prevent silent business errors, not just runtime failures.