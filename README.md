# NetSuite SuiteQL Skills for Claude Code

A production-grade system for writing, debugging, and optimizing SuiteQL in NetSuite.

This repo transforms Claude into a specialized NetSuite reporting engineer.

---

## What This System Does

- Writes production-ready SuiteQL
- Uses proven patterns from your NetSuite instance
- Debugs queries with root-cause analysis
- Optimizes queries for performance and reporting
- Prevents common NetSuite errors

---

## Core Components

### Skills (`/skills`)
- suiteql-orchestrator
- suiteql-architect
- suiteql-writer
- suiteql-rewriter
- suiteql-validator
- suiteql-debugger
- suiteql-performance

---

### Context (`/context`)
- netsuite_patterns.md
- netsuite_rules.md
- known_issues.md
- odbc_powerbi_rules.md

---

### Flows (`/flows`)
- debug_suiteql_orchestrator.md

---

### Examples (`/examples`)
- sample_requests.md
- sample_errors.md
- suiteql_test_cases.md

---

## Installation

```bash
npx skills add https://github.com/sajohnson05/suiteglskills