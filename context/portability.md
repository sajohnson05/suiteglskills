# Portability Guide

## Purpose
This repository is built from proven SuiteQL patterns in one NetSuite environment.

Some patterns are broadly reusable across NetSuite accounts.
Others are environment-specific and should be validated before reuse.

This file helps other users adapt the system safely.

---

## What Is Likely Portable

These patterns are often reusable across many NetSuite environments:

- `Transaction` to `TransactionLine`
- line-level filtering with `MainLine = 'F'`
- document tracing with:
  - `PreviousTransactionLineLink`
  - `NextTransactionLineLink`
- shipping address joins through `TransactionShippingAddress`
- careful use of `BUILTIN.DF(...)`
- separation of line-level vs header-level reporting
- debugging for:
  - duplication
  - field exposure
  - status mismatches
  - header vs line issues

---

## What May Be Environment-Specific

These items may vary and should be validated locally:

- custom fields
- custom records
- department names
- class names
- location names
- workflow-specific status handling
- job/project relationships
- business-specific mapping logic
- ODBC behavior
- role permissions and exposure differences

---

## What Other Users Should Replace First

When adapting this system for another NetSuite account, review these first:

1. `context/netsuite_patterns.md`
   - replace or supplement with patterns proven in that environment

2. `context/known_issues.md`
   - update based on real field exposure and query behavior

3. `context/odbc_powerbi_rules.md`
   - adjust if downstream reporting stack differs

4. Department / division mapping logic
   - do not assume values are universal

---

## Recommended Onboarding for Other Users

### Step 1
Add 3 to 5 known working queries from the target environment into:
- `context/netsuite_patterns.md`

### Step 2
Document the first few common problems in:
- `context/known_issues.md`

### Step 3
Test the system against:
- one line-level query
- one header-level query
- one document-link query
- one debug case

### Step 4
Refine any skills that rely too heavily on environment-specific assumptions

---

## Portability Rules for Agents

When writing or debugging for an unfamiliar NetSuite instance:

- prefer caution over confidence
- label assumptions clearly
- avoid claiming a field is exposed unless proven
- provide fallback approaches when risk is meaningful
- preserve the difference between:
  - proven in this repo
  - inferred from common NetSuite behavior

---

## Good Portability Behavior

Good:
- "This join pattern is proven in the source repo, but should be validated in your environment."

Bad:
- "This will definitely work in all NetSuite instances."

---

## Key Principle

Treat proven patterns as strong evidence, not universal truth.