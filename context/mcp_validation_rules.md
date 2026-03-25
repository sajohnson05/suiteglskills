# MCP Validation Rules

## Purpose
This file defines how skills should behave when NetSuite MCP is used for live validation.

The goal is to prevent overclaiming and to make sure live validation is clearly separated from design-only reasoning.

---

## 1. MCP Must Be Confirmed

A skill must not assume NetSuite MCP is available.

Before using MCP, confirm that it is:
- configured
- available in the current session
- authorized for use

If any of these are unclear, the skill should ask before proceeding with live validation.

---

## 2. Design-Only vs Live-Validated Mode

Every MCP-aware response should clearly operate in one of two modes:

### Design-Only Mode
Use when:
- MCP is unavailable
- MCP is not authorized
- live execution cannot be performed

Must state clearly:
- live NetSuite validation did not occur
- response is based on query logic, patterns, and known rules

### Live-Validated Mode
Use when:
- MCP is available
- MCP is authorized
- live data has been checked

Must state clearly:
- validation was performed against live NetSuite data
- what source or result was compared
- what variance was found, if any

---

## 3. Never Fabricate Validation

Do not:
- imply a live query was run when it was not
- claim that values tie without a real comparison basis
- present inferred totals as validated facts

If validation did not occur, say so directly.

---

## 4. Name the Validation Basis

When using MCP, clearly state:
- which environment is being validated
- what source-of-truth is being compared
- what filters, date logic, and status logic are being used
- what grain is being validated

Without a comparison basis, validation is incomplete.

---

## 5. Validate the Right Grain

Before comparing results, define whether validation is occurring at:
- line-level
- transaction-level
- summarized level

Do not compare values across different grains without explaining the transformation.

---

## 6. Separate Facts from Interpretation

In live-validated mode, separate:
- validated facts
- inferred explanation

Example:
- Validated fact: "The SuiteQL result returned 1,245,332.18 and the saved search returned 1,243,901.12"
- Interpretation: "The variance likely comes from status filter differences or a one-to-many line linkage"

---

## 7. Permissions and Visibility Matter

MCP validation may still differ from another user's result because of:
- role restrictions
- subsidiary restrictions
- search audience settings
- field visibility
- environment differences

Skills should call this out when relevant.

---

## 8. Smallest Correct Fix First

If live validation shows a mismatch, recommend the smallest correct next action first.

Examples:
- confirm status filter
- compare line counts
- validate date basis
- isolate one transaction
- test header-only version
- confirm role permissions

---

## 9. Output Standard for MCP-Aware Responses

A strong MCP-aware response should include:
- Validation Mode
- Reconciliation Goal
- Reference Source
- Comparison Basis
- Expected Grain
- Validation Result
- Variance
- Likely Cause
- Recommended Fix
- Next Validation Step

---

## 10. Key Principle

MCP increases confidence only when the validation basis is clear.

Live data without clear comparison logic is still incomplete validation.