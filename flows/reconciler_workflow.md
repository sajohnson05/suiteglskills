# Reconciler Workflow

## Purpose
This workflow standardizes how SuiteQL reconciliations should be handled so the result is accurate, repeatable, and easy for another person to review.

This workflow should be used when reconciling:
- SuiteQL vs NetSuite reports
- SuiteQL vs saved searches
- SuiteQL vs Power BI datasets
- header totals vs line sums
- PO amounts vs billed amounts
- backlog, revenue, cost, AR, and AP logic

The goal is not just to write a query.
The goal is to clearly prove what was compared, how it was compared, and why it matched or did not match.

---

## Required Inputs
Before starting, gather as much of the following as possible:

- business question
- source-of-truth being tied to
- original query, if one exists
- expected output grain
- expected total or control total
- date logic being used
- status logic being used
- whether NetSuite MCP is available and authorized

If some items are missing, state the assumption clearly.

---

## Workflow Steps

### Step 1: Define the Reconciliation Goal
State clearly:
- what is being tied out
- what the comparison pair is
- what decision depends on the result

Examples:
- "Tie PO totals to related vendor bill totals"
- "Compare saved search total to SuiteQL total"
- "Validate Power BI backlog total against live NetSuite data"

---

### Step 2: Name the Reference Source
Always identify the source-of-truth.

Possible reference sources:
- native NetSuite report
- saved search
- workbook
- dashboard value
- Power BI dataset
- manual control total
- MCP query result

Do not proceed vaguely.
A reconciliation without a named reference source is incomplete.

---

### Step 3: Define the Comparison Basis
State the basis of comparison:

- date field
- date range
- transaction type
- status logic
- role or visibility assumptions
- environment used
- whether comparison is header-level, line-level, or summarized

This is required because two technically correct totals can differ if the basis is different.

---

### Step 4: Define the Grain
Determine the intended grain:

- line-level
- transaction-level
- summarized

Do not mix grain without explicitly stating it.

Common risk:
- comparing a transaction header total to line-level detail without aggregation

---

### Step 5: Check MCP Availability and Authorization
Before live validation, determine whether NetSuite MCP is:

- configured
- available in the session
- authorized

If not confirmed, ask:

"Do you have NetSuite MCP available and authorized for this session so I can validate results against your live environment?"

If MCP is unavailable:
- proceed in design-only mode
- label the response accordingly

If MCP is available:
- use it as the live validation layer
- label validated output clearly

---

### Step 6: Write or Review the Query
Use the smallest correct surface area.

Reference:
- `context/netsuite_patterns.md`
- `context/netsuite_rules.md`
- `context/known_issues.md`
- `context/reconciliation_rules.md`
- `context/odbc_powerbi_rules.md` if reporting output is involved

Rules:
- preserve working logic when possible
- prefer proven patterns over speculative joins
- avoid blind full rewrites
- define or preserve grain correctly

---

### Step 7: Validate the Result
If MCP is available:
- execute or compare against live values
- capture actual value
- capture expected value
- calculate variance

If MCP is not available:
- provide the query logic
- explain the validation plan
- state clearly that live validation has not occurred

---

### Step 8: Diagnose Variance
If a mismatch exists, explain the most likely cause.

Common causes:
- header vs line mismatch
- duplicate rows
- status filter mismatch
- date filter mismatch
- timing difference
- role/permission difference
- missing lines
- one-to-many document linkage
- display value vs raw value mismatch
- report logic differs from query logic

Do not just say "it does not tie."
Explain why it most likely does not tie.

---

### Step 9: Recommend the Smallest Correct Fix
Recommend the smallest practical corrective action first.

Examples:
- adjust status filter
- aggregate line amounts correctly
- remove duplicate join path
- match date field to source report
- validate role visibility
- compare header-only first, then line-level detail

Do not over-engineer.

---

### Step 10: Recommend the Next Validation Step
If the reconciliation is still not fully resolved, recommend the next best step.

Examples:
- compare line counts
- test a header-only version
- compare saved search criteria
- rerun with MCP
- validate role permissions
- isolate one transaction and trace document links

This makes the result actionable for the team.

---

## Output Standard

Every reconciliation response should include:

- Reconciliation Goal
- Reference Source
- Comparison Basis
- Expected Grain
- Validation Mode
- Query or Query Logic
- Validation Result
- Variance
- Likely Cause
- Recommended Fix
- Next Validation Step
- Watchouts

---

## Validation Modes

### Design-Only Mode
Use when MCP is not available or not authorized.

Must state:
- validation is based on query design and known patterns
- live values were not confirmed

### Live-Validated Mode
Use when MCP is available and authorized.

Must state:
- validation was performed against live NetSuite data
- which source/result was compared
- what variance was found

---

## Guardrails

- Do not fabricate live validation
- Do not claim a tie-out is complete unless the comparison basis is clear
- Do not hide duplication with `GROUP BY` without explaining the cause
- Do not overstate certainty when only part of the reconciliation is validated
- Do not assume saved search logic and SuiteQL logic are identical
- Do not mix header and line grain without explanation

---

## Success Criteria

A reconciliation is successful when:

- the pair being reconciled is clearly named
- the reference source is clear
- the comparison basis is clear
- the grain is correct
- the query logic is appropriate
- the variance is quantified
- the likely cause is practical and believable
- the next step is actionable