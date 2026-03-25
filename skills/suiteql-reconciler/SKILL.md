# SuiteQL Reconciler

## Purpose
Validate that SuiteQL results align with the live NetSuite environment and with the values the team is using for reporting, reconciliation, and decision-making.

This skill is designed for reconciliation work where accuracy matters more than elegant SQL.

It should be used for:
- report tie-outs
- saved search vs SuiteQL comparisons
- NetSuite report vs Power BI comparisons
- invoice, PO, bill, backlog, revenue, and cost reconciliations
- validating totals before dashboards or analyses are shared

---

## Operating Modes

### Mode 1: Without NetSuite MCP
If NetSuite MCP is not available, this skill should:
- define the reconciliation objective
- identify the most likely source-of-truth
- write or review the SuiteQL needed
- explain likely mismatch causes
- provide a practical validation plan

### Mode 2: With NetSuite MCP
If NetSuite MCP is available, this skill should:
- use NetSuite MCP as the live validation layer
- compare SuiteQL results to the live values in the environment
- identify variances
- explain likely causes
- recommend the smallest correct fix

---

## Responsibilities

### 1. Define the Reconciliation Target
Clearly state:
- what is being tied out
- what the reference source is
- what level of detail is expected

Examples:
- PO total vs related vendor bill total
- invoice total vs sum of transaction lines
- backlog report vs open PO logic
- saved search total vs SuiteQL result
- Power BI extract vs NetSuite source report

### 2. Define the Grain
Determine whether the reconciliation should occur at:
- line-level
- transaction-level
- summarized level

Do not mix grain without explicitly stating it.

### 3. Write or Review the Query
Use:
- `context/netsuite_patterns.md`
- `context/netsuite_rules.md`
- `context/known_issues.md`
- `context/reconciliation_rules.md`

Preserve working logic whenever possible.

### 4. Validate Against Live Environment
If MCP is available:
- execute or compare against live values
- confirm whether the totals align
- report exact variance when possible

### 5. Explain Variances
Possible causes include:
- header vs line mismatch
- duplicate rows
- status filter mismatch
- date filter mismatch
- timing difference
- role/permission difference
- missing lines
- one-to-many document linkage
- use of display values instead of raw values

### 6. Recommend Corrective Action
Always recommend the smallest practical fix first.

---

## Required Output Format

- Reconciliation Goal
- Reference Source
- Expected Grain
- Query or Query Logic
- Validation Result
- Variance
- Likely Cause
- Recommended Fix
- Watchouts

---

## Rules

1. Accuracy first
2. Do not assume business definitions without stating them
3. Do not claim a tie-out is complete unless the comparison basis is clear
4. Preserve working logic where possible
5. Prefer proven patterns over speculative joins
6. If MCP is unavailable, be explicit that validation is design-only
7. If MCP is available, separate:
   - live validated facts
   - inferred explanations

---

## Success Criteria

- Reconciliation target is clearly defined
- Query logic matches the business question
- Grain is correct
- Variances are explained in practical terms
- Output helps the team trust the result