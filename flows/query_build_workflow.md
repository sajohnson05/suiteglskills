# Query Build Workflow

## Purpose
This workflow standardizes how a new SuiteQL query should be built from a business question or reporting request.

It is designed to make query creation:
- accurate
- repeatable
- easy to review
- safer for NetSuite, ODBC, and Power BI use cases

---

## Required Inputs
Gather as much of the following as possible:

- business question
- expected output
- expected grain
- date logic
- required filters
- downstream use case
- existing query to modify, if any
- known error or issue, if any

If anything is missing, state assumptions clearly.

---

## Workflow Steps

### Step 1: Frame the Business Question
Clarify:
- what the user is actually asking for
- what business decision the query supports
- whether the output is operational, financial, or analytical

Examples:
- open POs
- backlog sold but not shipped
- invoice GP by rep
- projects sold and shipped
- PO to bill reconciliation

---

### Step 2: Define the Output Grain
Determine whether the query should return:
- line-level detail
- transaction-level detail
- summarized output

Do not write SQL before the grain is clear.

---

### Step 3: Identify the Closest Proven Pattern
Check:
- `context/netsuite_patterns.md`
- `context/netsuite_rules.md`
- `context/known_issues.md`

Use the closest working pattern first.
Do not invent new join logic unless necessary.

---

### Step 4: Design the Query Structure
Determine:
- tables
- join direction
- filter logic
- date basis
- status logic
- raw vs display fields
- whether the query is intended for ODBC / Power BI

---

### Step 5: Write the Query
Use the smallest correct design.

Rules:
- prefer explicit joins
- preserve correct grain
- use `MainLine = 'F'` when line-level detail is required
- avoid unnecessary `BUILTIN.DF(...)` in filters
- avoid over-engineering

---

### Step 6: Validate the Query Logic
Check for:
- incorrect joins
- header vs line mismatch
- duplicate row risk
- unsupported field risk
- status filter mismatch
- date logic mismatch

If needed, pass through validator or debugger logic before finalizing.

---

### Step 7: Optimize for Reporting Use Cases
If the query is intended for Power BI, ODBC, or extraction:
- reduce row volume early
- minimize display fields
- reduce unnecessary joins
- prefer raw IDs where useful downstream

Reference:
- `context/odbc_powerbi_rules.md`

---

### Step 8: Recommend Next Step
If the query is not fully validated, recommend the next best step.

Examples:
- test against one transaction
- compare line count to saved search
- validate status filters
- run reconciler workflow
- run live validation with MCP if available

---

## Output Standard

A strong query-build response should include:
- Goal
- Assumptions
- Expected Grain
- Primary Query
- Why This Should Work
- Risks / Watchouts
- Optional Improvements
- Next Step

---

## Guardrails

- do not invent unsupported fields
- do not mix header and line totals without explanation
- do not hide duplication with blind aggregation
- do not over-rewrite an existing working query
- do not optimize readability at the expense of correctness

---

## Success Criteria

A query build is successful when:
- the business question is translated correctly
- the grain is correct
- the query uses proven patterns where possible
- risks are named clearly
- the output is practical and testable