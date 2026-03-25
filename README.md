# NetSuite SuiteQL Skills for Claude Code

A production-ready set of Claude Code skills for writing, debugging, and optimizing SuiteQL in NetSuite.

This repo turns Claude into a specialized NetSuite reporting engineer that:
- Writes production-ready SuiteQL
- Uses proven patterns from your environment
- Avoids NetSuite-specific pitfalls (NOT_EXPOSED, bad joins, duplication)
- Debugs broken queries with clear root-cause fixes
- Supports multi-agent workflows for complex reporting

---

## Why This Exists

SuiteQL is not standard SQL.

Most AI-generated SQL fails in NetSuite due to:
- Unsupported fields
- Incorrect joins
- Header vs line confusion
- Document linkage errors
- Performance issues

This skill system solves that by:
- Encoding working patterns from your instance
- Using specialized agents instead of one generic prompt
- Enforcing validation before output

---

## What You Get

### 1. Multi-Agent SuiteQL System

| Agent | Purpose |
|------|--------|
| suiteql-orchestrator | Manages workflow |
| suiteql-architect | Designs joins and grain |
| suiteql-writer | Writes production SQL |
| suiteql-validator | Catches risks and errors |
| suiteql-debugger | Fixes broken queries |

---

### 2. Real NetSuite Context

Located in `/context/`

- `netsuite_patterns.md` → proven working queries
- `netsuite_rules.md` → NetSuite constraints and quirks

These are the most important files in the repo.

---

### 3. Debug Workflow (High Value)

Located in `/flows/`

- Structured process for:
  - fixing errors
  - removing duplicates
  - correcting joins
  - resolving NOT_EXPOSED issues

---

## Installation

Install the full skill set into Claude Code:

```bash
npx skills add https://github.com/YOUR_USERNAME/netsuite-suiteql-skills