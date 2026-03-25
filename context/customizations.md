# Customizations

## Purpose
This file captures environment-specific business logic, naming conventions, mappings, and reporting assumptions that are unique to this NetSuite instance or operating model.

This file should be used when:
- company-specific logic affects query design
- reporting definitions are not obvious from raw NetSuite structure
- department or business-unit mappings matter
- logic differs from what another NetSuite team might expect

This file should not be used for general NetSuite rules.
General rules belong in:
- `context/netsuite_rules.md`

Known system quirks belong in:
- `context/known_issues.md`

---

## Current Custom Business Logic

### 1. Department to Division Mapping
Current reporting logic groups the following departments into `Service`:

- GEO 10 General Service
- GEO 15 GSA
- GEO 13 Warranty
- GEO 11 Tower Service
- GEO 14 Building Intelligence
- GEO 12 MRG Interoffice
- Burden
- G&A
- Selling Expense

If a report needs division-level output, these departments may need to be mapped to `Service` rather than shown individually.

---

### 2. Equipment Reporting Logic
In some reporting use cases:
- `Equipment` may be treated differently from Service
- job or project identifiers may be used as the final reporting label instead of department

Example logic used previously:
- when department = `Equipment`, use job `entityId` as a reporting/project identifier

---

### 3. Job / Project Linking
A proven local pattern is:
- `TransactionLine.entity = job.id`

This should be considered a strong working pattern for job or project reporting in this environment, but should still be validated if the use case changes significantly.

---

### 4. Shipping Address Logic
For ship-to reporting in this environment, the proven pattern is:
- `Transaction.ShippingAddress = TransactionShippingAddress.nkey`

Do not assume direct ship state or city fields are available on `Transaction`.

---

### 5. Finance Reporting Use Cases
Common local reporting needs include:
- backlog sold but not shipped
- open purchase orders
- projects sold and shipped
- invoice revenue and gross profit by rep
- PO to bill reconciliation
- reporting by department, division, job, and class

These use cases should bias the system toward:
- practical reporting output
- extraction-friendly queries for Power BI
- explicit grain handling

---

### 6. Reconciliation Expectations
In this environment, reconciliation work often needs to compare:
- SuiteQL vs NetSuite report
- SuiteQL vs saved search
- SuiteQL vs Power BI
- header totals vs line sums
- PO amounts vs related billed amounts

The system should explicitly name:
- reference source
- comparison basis
- grain
- validation mode

---

### 7. Reporting Bias
For this environment, the system should prioritize:
- practical accuracy
- minimal guesswork
- production-ready logic
- preserved working joins
- smallest correct fix first

This repo is intended to support real finance and analytics work, not just ad hoc SQL generation.

---

## How to Maintain This File

Add to this file when:
- a recurring business rule affects query design
- a local reporting definition needs to be preserved
- a department / division / job mapping is reused often
- a local convention would not be obvious to an outside NetSuite user

Do not add:
- generic NetSuite constraints
- one-off bugs that belong in `known_issues.md`
- query patterns that belong in `netsuite_patterns.md`

---

## Key Principle

This file stores local business meaning.

It should make the system better at using the right logic for this environment without pretending that every rule is universal.