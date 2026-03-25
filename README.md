# NetSuite SuiteQL Skills for Claude Code

A production-grade SuiteQL skill system for Claude Code.

This repository helps Claude behave like a practical NetSuite reporting engineer by combining:
- specialized skills
- reusable context
- debug workflows
- performance guidance
- proven query patterns

---

## Quick Start

1. Clone the repo

git clone https://github.com/sajohnson05/suiteglskills.git
cd suiteglskills

2. Review key context files

- context/netsuite_patterns.md
- context/netsuite_rules.md
- context/known_issues.md

3. Validate skills

./validate-skills.sh

4. Install into Claude Code

npx skills add https://github.com/sajohnson05/suiteglskills

5. Start using

Example:

Show me open purchase orders with vendor, department, and job

---

## What This System Does

- Writes production-ready SuiteQL
- Debugs broken queries
- Rewrites existing queries safely
- Optimizes queries for Power BI / ODBC
- Translates business questions into query design
- Uses proven NetSuite patterns

---

## Repository Structure

This repository is organized into four layers:

- `skills/` for specialized Claude Code skills
- `context/` for reusable NetSuite reference material
- `flows/` for multi-step orchestration
- `examples/` for prompts, edge cases, and regression checks

```text
suiteglskills/
├── README.md
├── LICENSE
├── CLAUDE.md
├── validate-skills.sh
├── skills/
│   ├── suiteql-orchestrator/
│   │   └── SKILL.md
│   ├── suiteql-architect/
│   │   └── SKILL.md
│   ├── suiteql-intake/
│   │   └── SKILL.md
│   ├── suiteql-root-cause/
│   │   └── SKILL.md
│   ├── suiteql-writer/
│   │   └── SKILL.md
│   ├── suiteql-rewriter/
│   │   └── SKILL.md
│   ├── suiteql-validator/
│   │   └── SKILL.md
│   ├── suiteql-debugger/
│   │   └── SKILL.md
│   ├── suiteql-performance/
│   │   └── SKILL.md
│   ├── suiteql-analyst/
│   │   └── SKILL.md
│   └── suiteql-reconciler/
│       └── SKILL.md
│   └── suiteql-finance-reporting/
│       └── SKILL.md
├── context/
│   ├── index.md
│   ├── known_issues.md
│   ├── mcp_validation_rules.md
│   ├── netsuite_patterns.md
│   ├── netsuite_rules.md
│   ├── odbc_powerbi_rules.md
│   ├── portability.md
│   └── reconciliation_rules.md
├── flows/
│   ├── debug_suiteql_orchestrator.md
│   ├── query_build_workflow.md
│   └── reconciler_workflow.md
└── examples/
    ├── sample_requests.md
    ├── sample_errors.md
    ├── suiteql_test_cases.md
    ├── regression_checks.md
    └── reconciliation_cases.md
   
```
---

| Folder      | Purpose                                                                                               |
| ----------- | ----------------------------------------------------------------------------------------------------- |
| `skills/`   | Role-based Claude Code skills for writing, debugging, validating, optimizing, and reconciling SuiteQL |
| `context/`  | Shared reference files containing patterns, rules, portability notes, and known issues                |
| `flows/`    | Multi-step workflows, especially for debugging and structured problem solving                         |
| `examples/` | Sample prompts, error cases, regression checks, and reconciliation scenarios                          |

---

## Why this fixes it
The key is:
- use triple backticks
- use `text` after the opening fence
- keep the tree fully inside the code block
- do not let GitHub render it as normal paragraph text

---

## Quick terminal commands to update README and push

From your repo root:

```powershell
code README.md
```
---

## How to Use in Claude Code

### Write a Query

Show me open purchase orders with vendor, buyer, and job

---

### Debug a Query

This query duplicates rows and totals are wrong:

[paste query]

---

### Optimize for Power BI

Optimize this query for Power BI refresh:

[paste query]

---

### Start from Business Question

Show backlog sold but not shipped by department

---

## Skill Usage Guide

suiteql-analyst  
- Use for business questions

suiteql-architect  
- Defines joins and structure

suiteql-writer  
- Writes queries

suiteql-rewriter  
- Fixes existing queries without full rewrite

suiteql-validator  
- Checks correctness and duplication

suiteql-debugger  
- Fixes errors

suiteql-performance  
- Optimizes queries for speed and reporting

suiteql-intake  
- Summarizes request

suiteql-root-cause  
- Identifies issue

suiteql-orchestrator  
- Coordinates workflow

suiteql-finance-reporting
- starting from a finance or ops reporting question
- building backlog, billed vs unbilled, GP, AR/AP, or project profitability views
- turning reporting logic into a practical SuiteQL design

---

## Core Context Files

netsuite_patterns.md  
- Proven queries

netsuite_rules.md  
- SuiteQL rules

known_issues.md  
- Common failures

odbc_powerbi_rules.md  
- Reporting optimization

portability.md  
- Adapting to other NetSuite environments

index.md  
- Context navigation

---

## Debug Workflow

Located in:

flows/debug_suiteql_orchestrator.md

Steps:
1. Intake  
2. Root Cause  
3. Rewrite  
4. Validate  

---

### Reconciler workflow
Located in:
`flows/reconciler_workflow.md`

Use for:
- report tie-outs
- saved search comparisons
- Power BI to NetSuite validation
- live validation with NetSuite MCP

---

## Validation

Run:

./validate-skills.sh

---

## Design Principles

- working SQL > perfect SQL
- reuse proven patterns
- preserve working logic
- define grain first
- avoid duplicate rows
- optimize for extraction

---

## Contribution Standard

- keep changes focused
- reuse patterns
- document new learnings
- avoid generic SQL advice
- validate before commit

Good contributions:
- new patterns
- debug fixes
- performance improvements

Avoid:
- theory without application
- unsupported assumptions

---

## Portability

This repo is based on one NetSuite environment.

Other users should:
- add their own patterns
- validate fields locally
- update known issues

---

## Final Note

This is not a prompt library.

This is a structured SuiteQL system for real-world use.