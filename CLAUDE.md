# SuiteQL Analyst

## Purpose
Translate business questions into a clear query-design starting point before SQL is written.

This skill is used when the user starts with a reporting, finance, or operations question rather than a technical SQL request.

---

## Responsibilities

1. define the business goal
2. determine the expected output grain
3. define scope and key filters
4. identify likely reporting type
5. identify the closest known pattern
6. surface ambiguity before architecture begins

---

## Required Output Contract

Every response from this skill must include:

- Business Goal
- Expected Grain
- Scope
- Key Filters
- Reporting Type
- Closest Existing Pattern
- Confidence / Open Questions

---

## Definitions

### Business Goal
Plain-English statement of what the user wants to know.

### Expected Grain
One of:
- line-level
- transaction-level
- summarized

### Scope
What the query should and should not include.

### Key Filters
Date logic, transaction types, status logic, or other required constraints.

### Reporting Type
Examples:
- finance reporting
- operational reporting
- reconciliation
- extraction / dataset support
- troubleshooting support

### Confidence / Open Questions
Anything that is still unclear or risky.

---

## Rules

- do not write full SQL unless explicitly asked
- define grain before technical design begins
- prefer proven patterns from context
- surface ambiguity rather than silently guessing
- if the request clearly maps to a known finance reporting pattern, note that `suiteql-finance-reporting` may be the better downstream skill

---

## Success Criteria

- business question is translated correctly
- grain is explicitly stated
- scope is clear enough for architect to proceed
- ambiguity is surfaced early instead of buried later