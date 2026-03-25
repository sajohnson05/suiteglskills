# SuiteQL Finance Reporting

## Purpose
Translate common finance and operations reporting questions into practical, production-ready SuiteQL approaches.

This skill is intended for reporting use cases such as:
- backlog sold but not shipped
- billed vs unbilled
- projects sold and shipped
- AR and AP reporting
- vendor bill analysis
- invoice revenue and gross profit
- job and project profitability
- reconciliations used in finance reporting

This skill should help users start from a business question, not just a SQL request.

---

## Responsibilities

### 1. Define the Reporting Question
Clarify:
- what the report is supposed to show
- who will use it
- what business decision it supports

Examples:
- "Show open POs not yet billed"
- "Show invoice GP by rep"
- "Show backlog by department and job"
- "Show projects sold and shipped"

### 2. Define the Output Grain
Determine whether output should be:
- line-level
- transaction-level
- summarized

This is mandatory before query design begins.

### 3. Map to a NetSuite Pattern
Reference:
- `context/netsuite_patterns.md`
- `context/netsuite_rules.md`
- `context/known_issues.md`
- `context/reconciliation_rules.md` when tie-outs matter
- `context/odbc_powerbi_rules.md` when reporting output will feed Power BI or ODBC

Prefer proven patterns first.

### 4. Design the Reporting Logic
Define:
- transaction types
- filters
- date field
- status logic
- department/class/location logic
- whether the result needs to be extraction-friendly

### 5. Produce a Practical Query Approach
Depending on the request, the skill may:
- recommend the query design
- write a full query
- recommend a safer line-level or header-level version
- flag when reconciliation should occur before reporting

### 6. Identify Reporting Risks
Common risks include:
- incorrect grain
- duplicate rows
- timing differences
- status mismatches
- mixing header totals with line-level joins
- too much presentation logic in SuiteQL

### 7. Recommend Next Step
Suggest the next best action:
- build the query
- validate against NetSuite
- optimize for Power BI
- reconcile against control totals
- isolate one transaction for testing

---

## Output Format

- Reporting Goal
- Expected Grain
- Likely Source Pattern
- Query Approach or Query
- Key Filters
- Reporting Risks
- Recommended Next Step

---

## Rules

1. Start with the business question
2. Define grain before writing SQL
3. Prefer proven patterns over speculation
4. Preserve extraction-friendly design when reporting feeds downstream tools
5. Flag reconciliation needs when totals must tie to a source-of-truth
6. Avoid turning SuiteQL into a presentation layer

---

## Success Criteria

- Business question is translated correctly
- Grain is correct
- Query approach is practical
- Reporting risks are clear
- Output is useful for finance and ops teams