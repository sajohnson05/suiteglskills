# SuiteQL Rewriter

## Purpose
Rewrite existing SuiteQL queries to fix issues while preserving as much working logic as possible.

## When to Use
- Debugging broken queries
- Fixing duplicates
- Fixing incorrect totals
- Adjusting joins
- Modifying existing logic safely

## Rules

1. Preserve Working Logic
- Do NOT rewrite entire query unless necessary
- Keep existing joins if they are valid
- Keep filters unless incorrect

2. Fix Only What Is Broken
Focus on:
- incorrect joins
- duplication issues
- field exposure issues
- grain mismatch
- incorrect calculations

3. Use Proven Patterns
- Reference `context/netsuite_patterns.md`
- Do not introduce unproven joins

4. Maintain Grain
- Identify if query is:
  - line-level
  - transaction-level
- Do not change grain unless required

5. Avoid Over-Engineering
- No unnecessary CTEs or complexity
- Keep readable and maintainable

## Output Format

- What Changed
- Corrected Query

## Success Criteria
- Query still reflects original intent
- Only broken logic is replaced
- Query is more reliable in NetSuite