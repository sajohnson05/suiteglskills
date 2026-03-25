# Reconciliation Rules

## Purpose
This file defines how SuiteQL reconciliations should be approached in a disciplined, repeatable way.

The goal is not just to write a query.
The goal is to prove that the result aligns with the source-of-truth being used by the team.

---

## 1. Always Define the Reconciliation Pair

A reconciliation is always between two things.

Examples:
- SuiteQL result vs NetSuite report
- SuiteQL result vs saved search
- SuiteQL result vs Power BI dataset
- transaction header total vs line sum
- PO amount vs billed amount
- invoice amount vs recognized revenue logic

Never say a result is "correct" without stating what it is being compared to.

---

## 2. Define Grain Before Comparing Totals

Before comparing values, define whether the comparison is at:
- line-level
- transaction-level
- summarized level

Common failure:
- comparing a header total to line-level detail without aggregation

---

## 3. Match Filters Exactly

A valid reconciliation requires matching:
- date range
- transaction type
- status logic
- subsidiaries, departments, classes, locations
- entity filters
- role-based visibility where relevant

If filters differ, totals may differ for valid reasons.

---

## 4. Match Date Logic Exactly

Check:
- transaction date
- posting date
- due date
- last modified date
- expected receipt date

Do not assume two reports use the same date basis.

---

## 5. Match Status Logic Exactly

NetSuite results often differ because one source uses:
- internal status codes

while another uses:
- display status values
- workbook/report logic
- saved search filters

State status logic clearly.

---

## 6. Watch for Header vs Line Mismatch

Common trap:
- using `Transaction.ForeignTotal` in a query joined to `TransactionLine`

This often inflates totals.

Correct approach:
- reconcile header-to-header
- or aggregate line amounts to header level first

---

## 7. Watch for Duplicate Rows from Link Tables

Link tables can multiply rows:
- `PreviousTransactionLineLink`
- `NextTransactionLineLink`

Do not hide duplication with `GROUP BY` unless the business grain supports it.

First explain why duplication occurs.

---

## 8. Separate Timing Differences from Logic Errors

A mismatch is not always a broken query.

Possible non-error causes:
- bill posted later than PO date
- payroll timing
- partially billed transaction
- report refresh timing
- status transition timing

Always consider timing before declaring the query wrong.

---

## 9. Separate Permission Differences from Data Differences

If different users or tools see different totals, possible causes include:
- role restrictions
- subsidiary restrictions
- field visibility
- saved search audience settings

If MCP is used, state what environment and role the validation comes from when possible.

---

## 10. Prefer Raw Fields for Reconciliation

For tie-out work, prefer:
- internal IDs
- raw amounts
- raw statuses

Use display fields only when needed for readability.

---

## 11. State the Source-of-Truth

Possible sources:
- native NetSuite report
- saved search
- workbook
- dashboard value
- Power BI model
- manually provided control total

The reconciler should always name the source-of-truth.

---

## 12. Document the Variance Clearly

When a mismatch exists, report:
- expected value
- actual value
- variance amount
- variance direction
- likely cause

Do not just say "it does not tie."

---

## 13. Smallest Correct Fix First

When correcting a mismatch:
- preserve working logic
- change the smallest correct surface area
- avoid full rewrites unless necessary

---

## 14. Reconciliation Output Standard

A strong reconciliation response should include:
- goal
- source-of-truth
- grain
- filters
- query logic
- result
- variance
- cause
- next step

---

## 15. Key Principle

A reconciliation is only useful if another person can understand:
- what was compared
- how it was compared
- why it matched or did not match