# Context Index

## Purpose
This file helps both human users and Claude locate the right context file quickly.

Use this as the starting point when deciding which reference material applies.

---

## Core Context Files

### `context/netsuite_patterns.md`
Use for:
- proven working queries
- join patterns
- line-link patterns
- shipping address joins
- purchasing and billing patterns

Best when:
- writing new queries
- modifying old queries
- finding a known pattern to reuse

---

### `context/netsuite_rules.md`
Use for:
- general SuiteQL rules
- field exposure guidance
- status logic guidance
- line vs header guidance
- common NetSuite constraints

Best when:
- checking correctness
- validating structure
- avoiding avoidable mistakes

---

### `context/known_issues.md`
Use for:
- environment-specific failures
- recurring debug problems
- weird field behavior
- duplication traps
- ODBC quirks already observed

Best when:
- troubleshooting
- debugging broken queries
- diagnosing wrong totals

---

### `context/odbc_powerbi_rules.md`
Use for:
- extraction-focused query design
- Power BI and ODBC performance
- raw ID vs display value decisions
- row volume guidance
- downstream modeling guidance

Best when:
- building datasets for reporting
- optimizing large queries
- preparing SuiteQL for Power BI

---

### `context/portability.md`
Use for:
- adapting this repo to another NetSuite instance
- separating universal vs local logic
- identifying what should be replaced first

Best when:
- sharing this repo with others
- onboarding a new environment
- reducing overconfidence in unproven logic

---

## Suggested Context Routing

### If the task is "write a new query"
Start with:
1. `netsuite_patterns.md`
2. `netsuite_rules.md`

### If the task is "debug a broken query"
Start with:
1. `known_issues.md`
2. `netsuite_patterns.md`
3. `netsuite_rules.md`

### If the task is "optimize for Power BI or ODBC"
Start with:
1. `odbc_powerbi_rules.md`
2. `netsuite_patterns.md`

### If the task is "adapt this for another user or account"
Start with:
1. `portability.md`
2. `netsuite_patterns.md`
3. `known_issues.md`

---

## Key Principle

Choose the smallest relevant set of context files first.
Do not load everything unless the task truly requires it.