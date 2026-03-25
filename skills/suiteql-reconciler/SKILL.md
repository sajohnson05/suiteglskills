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
If NetSuite MCP is not available or not authorized, this skill should:
- define the reconciliation objective
- identify the most likely source-of-truth
- write or review the SuiteQL needed
- explain likely mismatch causes
- provide a practical validation plan

### Mode 2: With NetSuite MCP
If NetSuite MCP is available and authorized, this skill should:
- use NetSuite MCP as the live validation layer
- compare SuiteQL results to the live values in the environment
- identify variances
- explain likely causes
- recommend the smallest correct fix

---

## MCP Usage and Authorization

This skill should determine whether NetSuite MCP access is configured, available in the session, and authorized before attempting live validation.

### Step 1: Check Availability
If MCP access is not confirmed, ask:

"Do you have NetSuite MCP available and authorized for this session so I can validate results against your live environment?"

### Step 2: Do Not Assume Access
- Do not assume MCP is available
- Do not fabricate results
- Do not claim validation occurred without MCP

### Step 3: If MCP Is Available
- Use MCP to validate results
- Compare query output to live values
- Clearly label results as "validated against live NetSuite data"

### Step 4: If MCP Is Not Available
- Proceed in design-only mode
- Clearly state:
  "This validation is based on query logic and patterns, not live NetSuite data"

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

### 2. Define the Comparison Basis
Clearly state:
- date field being used
- status logic being used
- role or visibility assumptions
- whether comparison is header-level, line-level, or summarized

### 3. Define the Grain
Determine whether the reconciliation should occur at:
- line-level
- transaction-level
- summarized level

Do not mix grain without explicitly stating it.

### 4. Write or Review the Query
Use:
- `context/netsuite_patterns.md`
- `context/netsuite_rules.md`
- `context/known_issues.md`
- `context/reconciliation_rules.md`

Preserve working logic whenever possible.

### 5. Validate Against Live Environment
If MCP is available:
- execute or compare against live values
- confirm whether the totals align
- report exact variance when possible

### 6. Explain Variances
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

### 7. Recommend Corrective Action
Always recommend the smallest practical fix first.

### 8. Recommend Next Validation Step
If the issue is not fully resolved, recommend the next best action:
- validate status filters
- compare line counts
- test header-only version
- confirm role permissions
- compare against saved search logic
- rerun against live environment with MCP

---

## Required Output Format

- Reconciliation Goal
- Reference Source
- Comparison Basis
- Expected Grain
- Query or Query Logic
- Validation Mode
- Validation Result
- Variance
- Likely Cause
- Recommended Fix
- Next Validation Step
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
8. Do not overstate certainty when only part of the reconciliation has been validated

---

## Success Criteria

- Reconciliation target is clearly defined
- Reference source is named
- Comparison basis is clear
- Query logic matches the business question
- Grain is correct
- Variances are explained in practical terms
- Output helps the team trust the result