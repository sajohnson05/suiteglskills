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
│   ├── context_loading_order.md
│   ├── customizations.md
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

## Recommended Starting Points

Use these based on the task:

- writing a new query → `suiteql-analyst` or `suiteql-writer`
- fixing a broken query → `suiteql-debugger`
- improving performance → `suiteql-performance`
- validating totals → `suiteql-reconciler`
- building finance reporting logic → `suiteql-finance-reporting`

For context routing, see:
- `context/context_loading_order.md`

---

## Which Skill Gets Used for Which Problem

### `suiteql-analyst`
Use when:
- starting from a business question
- not sure what query should look like
- need correct grain and scope before SQL is written

### `suiteql-architect`
Use when:
- deciding tables, joins, and query structure
- defining line-level vs header-level output

### `suiteql-writer`
Use when:
- writing a new production-ready SuiteQL query

### `suiteql-rewriter`
Use when:
- modifying an existing working query
- fixing only part of a query
- preserving existing logic

### `suiteql-validator`
Use when:
- checking joins
- checking grain
- checking duplication risk
- reviewing correctness before use

### `suiteql-debugger`
Use when:
- query throws errors
- results are wrong
- fields are not exposed
- joins break unexpectedly

### `suiteql-performance`
Use when:
- query is slow
- query is used in ODBC
- query feeds Power BI
- dataset size is too large

### `suiteql-reconciler`
Use when:
- tying SuiteQL to NetSuite reports or saved searches
- validating Power BI totals against source data
- reconciling header totals vs line sums
- using NetSuite MCP for live validation when available

### `suiteql-finance-reporting`
Use when:
- starting from a finance or ops reporting question
- building backlog, billed vs unbilled, GP, AR/AP, or project profitability views
- translating reporting logic into a practical SuiteQL design

### `suiteql-intake`
Use when:
- summarizing the request and problem before debugging or rewriting

### `suiteql-root-cause`
Use when:
- diagnosing the most likely NetSuite-specific failure point

### `suiteql-orchestrator`
Use when:
- coordinating multiple specialized skills into one workflow

---

## Core Context Files

### `context/index.md`
High-level guide for locating the right context file quickly.

### `context/context_loading_order.md`
Defines which context files should be loaded first based on the task:
- new query writing
- debugging
- reconciliation
- Power BI / ODBC optimization
- finance reporting
- portability

### `context/customizations.md`
Captures business-specific logic and local reporting assumptions for this NetSuite environment.

### `context/netsuite_patterns.md`
Proven working query patterns from the source environment.

### `context/netsuite_rules.md`
Core SuiteQL rules and constraints.

### `context/known_issues.md`
Real failure cases and common traps.

### `context/odbc_powerbi_rules.md`
Guidance for extraction-friendly query design for Power BI and ODBC.

### `context/mcp_validation_rules.md`
Rules for using NetSuite MCP safely and clearly when performing live validation.

### `context/reconciliation_rules.md`
Rules for disciplined tie-outs and variance analysis.

### `context/portability.md`
Guidance for adapting this system to another NetSuite environment.

---

## Which Skill Gets Used for Which Problem

### `suiteql-analyst`
Use when:
- starting from a business question
- not sure what query should look like
- need correct grain and scope before SQL is written

### `suiteql-architect`
Use when:
- deciding tables, joins, and query structure
- defining line-level vs header-level output

### `suiteql-writer`
Use when:
- writing a new production-ready SuiteQL query

### `suiteql-rewriter`
Use when:
- modifying an existing working query
- fixing only part of a query
- preserving existing logic

### `suiteql-validator`
Use when:
- checking joins
- checking grain
- checking duplication risk
- reviewing correctness before use

### `suiteql-debugger`
Use when:
- query throws errors
- results are wrong
- fields are not exposed
- joins break unexpectedly

### `suiteql-performance`
Use when:
- query is slow
- query is used in ODBC
- query feeds Power BI
- dataset size is too large

### `suiteql-reconciler`
Use when:
- tying SuiteQL to NetSuite reports or saved searches
- validating Power BI totals against source data
- reconciling header totals vs line sums
- using NetSuite MCP for live validation when available

### `suiteql-finance-reporting`
Use when:
- starting from a finance or ops reporting question
- building backlog, billed vs unbilled, GP, AR/AP, or project profitability views
- translating reporting logic into a practical SuiteQL design

### `suiteql-intake`
Use when:
- summarizing the request and problem before debugging or rewriting

### `suiteql-root-cause`
Use when:
- diagnosing the most likely NetSuite-specific failure point

### `suiteql-orchestrator`
Use when:
- coordinating multiple specialized skills into one workflow

---

## Workflows

### Debug workflow
Located in:
`flows/debug_suiteql_orchestrator.md`

Use for:
- broken queries
- duplicate rows
- wrong totals
- field exposure issues
- join troubleshooting

### Query build workflow
Located in:
`flows/query_build_workflow.md`

Use for:
- building a new query from a business question
- defining grain before writing SQL
- choosing the correct proven pattern
- producing practical, testable SuiteQL

### Reconciler workflow
Located in:
`flows/reconciler_workflow.md`

Use for:
- report tie-outs
- saved search comparisons
- Power BI to NetSuite validation
- live validation with NetSuite MCP
- variance explanation and next-step recommendations

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