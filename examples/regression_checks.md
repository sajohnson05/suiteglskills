# Regression Checks

## Purpose
This file acts as a practical QA checklist for the SuiteQL system.

Use it to verify that new skills, prompt changes, and context updates do not break core behaviors.

---

## 1. Shipping Address Exposure

### Prompt
I need ship state from transaction headers.

### Expected Behavior
- system warns that direct shipping fields may not be exposed
- system prefers `TransactionShippingAddress`
- system does not confidently use `Transaction.shipstate` unless proven

---

## 2. PO to Bill Linking

### Prompt
Show purchase orders and their related vendor bills.

### Expected Behavior
- system prefers `NextTransactionLineLink`
- system explains line-level linkage risk
- system warns about one-to-many duplication when relevant

---

## 3. Backward Document Tracing

### Prompt
Trace a PO back to the related sales order and estimate.

### Expected Behavior
- system prefers `PreviousTransactionLineLink`
- system maintains correct join direction
- system does not invent unsupported shortcut logic

---

## 4. Header vs Line Grain

### Prompt
Show PO totals and join to PO lines.

### Expected Behavior
- system flags grain risk
- system avoids mixing header totals with line-level joins without explanation
- system either stays line-level or aggregates correctly

---

## 5. Duplicate Rows

### Prompt
This query duplicates rows.

### Expected Behavior
- system explains why duplication occurs
- system does not use `GROUP BY` as a blind fix
- system identifies the join causing multiplication

---

## 6. NOT_EXPOSED Risk

### Prompt
Use fields that are commonly missing in SuiteQL.

### Expected Behavior
- system flags likely exposure issue
- system proposes proven alternative
- system clearly labels uncertainty

---

## 7. ODBC / Power BI Optimization

### Prompt
I need this query for Power BI.

### Expected Behavior
- system prefers raw IDs where appropriate
- system reduces unnecessary `BUILTIN.DF(...)`
- system limits joins and row volume
- system avoids presentation-heavy SQL

---

## 8. Existing Query Modification

### Prompt
Modify this working query to add one new field.

### Expected Behavior
- system preserves working logic
- system changes the smallest correct surface area
- system does not over-rewrite the query

---

## 9. Analyst Framing

### Prompt
Show backlog sold but not shipped.

### Expected Behavior
- system defines the business question
- system determines correct grain
- system identifies likely tables and filters before writing SQL

---

## 10. Environment Portability

### Prompt
Will this work in another NetSuite instance?

### Expected Behavior
- system distinguishes proven vs inferred logic
- system references portability guidance
- system avoids overclaiming universality

---

## Pass Standard

The system is behaving correctly when it:
- uses proven patterns first
- identifies grain correctly
- flags realistic risks
- avoids generic SQL answers
- produces practical, testable SuiteQL