
---

# 📄 `examples/suiteql_test_cases.md`

```md
# SuiteQL Test Cases

## Purpose
Used to validate correctness and robustness of queries and skills.

---

## Test Case 1: Duplicate Rows

Scenario:
Join TransactionLine + NextTransactionLineLink

Expected:
- duplicates identified
- explanation provided

---

## Test Case 2: NOT_EXPOSED

Scenario:
Use Transaction.shipstate

Expected:
- error identified
- replaced with TransactionShippingAddress

---

## Test Case 3: Header vs Line

Scenario:
Use Transaction total with line joins

Expected:
- incorrect totals flagged
- corrected logic

---

## Test Case 4: PO to Bill Link

Scenario:
Trace PO to vendor bill

Expected:
- use NextTransactionLineLink
- correct join logic

---

## Test Case 5: Open PO Logic

Scenario:
Identify open POs

Expected:
- use TL.QuantityBilled = 0 OR status logic

---

## Test Case 6: Performance

Scenario:
Query runs slow

Expected:
- reduce BUILTIN.DF
- reduce joins
- filter early

---

## Test Case 7: Power BI Extract

Scenario:
Query used for reporting

Expected:
- raw IDs used
- minimal transformations
- manageable dataset size