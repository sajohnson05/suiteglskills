# Debug SuiteQL Orchestrator

## Purpose
This flow is used when a SuiteQL query:
- fails to run
- throws an error
- returns duplicate rows
- returns incorrect totals
- returns wrong grain
- performs poorly

The goal is to diagnose the real NetSuite-specific issue and return a corrected query.

---

## Inputs Required
- Business goal
- Original query
- Error message (if any)
- Expected result (grain + output)

---

## Agent Workflow

### Step 1: Intake
Send to: suiteql-intake

Output:
- Business goal
- Expected grain (line vs transaction)
- Symptoms (error, duplicates, wrong totals, etc.)
- Closest matching pattern from netsuite_patterns.md

---

### Step 2: Root Cause Analysis
Send to: suiteql-root-cause

Output:
- Likely NetSuite-specific issue
- Exact part of query causing problem
- Confidence level

---

### Step 3: Rewrite Query
Send to: suiteql-rewriter (or suiteql-writer)

Rules:
- Preserve working logic
- Fix only broken pieces unless full rewrite is required
- Use patterns from netsuite_patterns.md

Output:
- Corrected full query
- Summary of changes

---

### Step 4: Validate
Send to: suiteql-validator

Checks:
- Correct grain
- No unintended duplication
- Valid joins
- Field exposure safety
- Performance considerations

---

### Step 5: Return Final Output

## Final Output Format

### A. GOAL
Short description of what query should do

### B. ROOT CAUSE
Clear explanation of the issue

### C. CORRECTED QUERY
Full working SuiteQL

### D. WHY THIS FIX WORKS
Tie back to known working patterns

### E. WATCHOUTS
Any remaining risks

### F. FALLBACK OPTION (if needed)
Alternate approach if NetSuite limitations occur

---

## Mandatory Rules

- Do NOT give generic SQL advice
- Always diagnose NetSuite-specific issues
- Do NOT hide duplication with GROUP BY without explanation
- Always return a full corrected query
- Prefer proven patterns from netsuite_patterns.md