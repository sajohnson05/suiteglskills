# Context Loading Order

## Purpose
This file defines how the SuiteQL system should decide which context files to use first.

The goal is to improve context management by:
- loading the smallest relevant set of files first
- reducing irrelevant context
- improving consistency across skills
- making behavior easier to maintain as the repo grows

---

## Core Principle

Load the smallest relevant set of context files first.

Do not treat all context files as equally relevant.
Do not load everything unless the task truly requires it.

---

## Default Loading Order by Task Type

### 1. New Query Writing
Use when:
- writing a new SuiteQL query
- modifying a query for a new output
- translating a reporting request into SQL

Load in this order:
1. `context/netsuite_patterns.md`
2. `context/netsuite_rules.md`
3. `context/known_issues.md` if the request is risky or similar to prior failures
4. `context/odbc_powerbi_rules.md` if the query feeds Power BI, ODBC, or downstream reporting
5. `context/customizations.md` if environment-specific logic is involved

---

### 2. Query Debugging
Use when:
- query fails
- results are wrong
- rows are duplicated
- totals do not tie
- field exposure issues appear

Load in this order:
1. `context/known_issues.md`
2. `context/netsuite_patterns.md`
3. `context/netsuite_rules.md`
4. `context/customizations.md` if local business logic may affect the result
5. `context/odbc_powerbi_rules.md` if the issue occurs in reporting or extraction

---

### 3. Reconciliation
Use when:
- validating totals
- tying SuiteQL to NetSuite reports
- comparing SuiteQL to Power BI or saved searches
- explaining variances

Load in this order:
1. `context/reconciliation_rules.md`
2. `context/mcp_validation_rules.md` when MCP is available or requested
3. `context/netsuite_patterns.md`
4. `context/known_issues.md`
5. `context/customizations.md` if company-specific logic is involved

---

### 4. Power BI / ODBC Optimization
Use when:
- designing extraction queries
- improving performance
- preparing data for reporting models

Load in this order:
1. `context/odbc_powerbi_rules.md`
2. `context/netsuite_patterns.md`
3. `context/netsuite_rules.md`
4. `context/known_issues.md`
5. `context/customizations.md` if local mapping or logic affects the extract

---

### 5. Portability / Sharing with Other Teams
Use when:
- adapting the repo for another NetSuite instance
- helping another user onboard the system
- deciding what is universal vs environment-specific

Load in this order:
1. `context/portability.md`
2. `context/netsuite_patterns.md`
3. `context/known_issues.md`
4. `context/customizations.md`

---

### 6. Finance and Operations Reporting
Use when:
- backlog
- billed vs unbilled
- sold vs shipped
- AP or AR views
- project and job profitability
- finance reporting logic

Load in this order:
1. `context/netsuite_patterns.md`
2. `context/customizations.md`
3. `context/netsuite_rules.md`
4. `context/reconciliation_rules.md` if totals must tie out
5. `context/odbc_powerbi_rules.md` if the result feeds reporting tools

---

## Skill-Level Guidance

### Analyst
Primary:
- `netsuite_patterns.md`
- `customizations.md`

Secondary:
- `netsuite_rules.md`

### Architect
Primary:
- `netsuite_patterns.md`
- `netsuite_rules.md`

Secondary:
- `known_issues.md`
- `customizations.md`

### Writer
Primary:
- `netsuite_patterns.md`
- `netsuite_rules.md`

Secondary:
- `customizations.md`

### Rewriter
Primary:
- `netsuite_patterns.md`
- `known_issues.md`

Secondary:
- `netsuite_rules.md`
- `customizations.md`

### Validator
Primary:
- `netsuite_rules.md`
- `known_issues.md`

Secondary:
- `netsuite_patterns.md`
- `odbc_powerbi_rules.md`

### Debugger
Primary:
- `known_issues.md`
- `netsuite_patterns.md`

Secondary:
- `netsuite_rules.md`
- `customizations.md`

### Performance
Primary:
- `odbc_powerbi_rules.md`
- `netsuite_patterns.md`

Secondary:
- `known_issues.md`

### Reconciler
Primary:
- `reconciliation_rules.md`
- `mcp_validation_rules.md`

Secondary:
- `netsuite_patterns.md`
- `known_issues.md`
- `customizations.md`

### Finance Reporting
Primary:
- `customizations.md`
- `netsuite_patterns.md`

Secondary:
- `netsuite_rules.md`
- `reconciliation_rules.md`

---

## Escalation Rule

Start narrow.
Expand context only when:
- the task is ambiguous
- the first context files do not explain the issue
- the task crosses multiple domains, such as reconciliation plus Power BI
- environment-specific logic is clearly involved

---

## Maintenance Rule

When adding new context files:
- define where they belong in the loading order
- do not let new files become "always load" files unless truly necessary

---

## Key Principle

Better context management means:
- less irrelevant context
- clearer priority
- more consistent output