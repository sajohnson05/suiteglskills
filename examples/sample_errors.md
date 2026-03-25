# Sample SuiteQL Errors

Use these to test debugging capabilities.

---

## NOT_EXPOSED Error

Error:
Field 'shipstate' is not exposed in this context

Cause:
Using Transaction.shipstate directly

Fix:
Join TransactionShippingAddress

---

## Duplicate Rows

Symptom:
Totals are inflated

Cause:
Joining TransactionLine + sales team + link tables

Fix:
- confirm grain
- adjust joins
- avoid GROUP BY as band-aid

---

## Invalid Identifier

Error:
Invalid identifier 'TransactionLinks'

Cause:
Table does not exist in SuiteQL

Fix:
Use:
- PreviousTransactionLineLink
- NextTransactionLineLink

---

## Incompatible Expression

Error:
Incompatible expression value types

Cause:
Comparing text to numeric or bad date conversion

Fix:
- align data types
- fix date logic

---

## Wrong Totals

Symptom:
Revenue too high

Cause:
Header total joined to line-level data

Fix:
- use line-level amounts
- or aggregate properly

---

## Missing Data

Symptom:
Expected rows not returned

Cause:
- incorrect status filter
- incorrect join direction

Fix:
- validate filter values
- check link tables

---

## Performance Issue

Symptom:
Query runs very slow

Cause:
- too many BUILTIN.DF calls
- large unfiltered dataset

Fix:
- filter earlier
- reduce joins