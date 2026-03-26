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

## Model Routing Policy

Use model selection as a policy guide for Claude Code sessions and subagent behavior.

This policy does not replace Claude Code model configuration. Actual model selection should be handled through:
- `/model`
- `claude --model ...`
- environment variables
- settings

### Default
- default to `sonnet`

### Use `opus` when:
- the request requires cross-skill reasoning across multiple specialist skills
- the problem is ambiguous, high-risk, or has competing interpretations
- financial or operational risk is material
- reconciliation requires interpreting conflicting sources
- the request involves designing a new reporting or operating structure
- environment-specific customizations create major uncertainty

### Use `sonnet` when:
- the task is structured and the objective is clear
- one or two skills are primarily involved
- a query is being written, rewritten, or debugged with clear scope
- a workflow is being created, followed, or improved
- finance reporting logic is known and does not involve major ambiguity

### Use `haiku` when:
- the task is simple, repetitive, or administrative
- formatting, summarization, extraction, checklisting, or cleanup is required
- validation is being performed against already-defined rules
- the request does not involve material risk or deep reasoning

### Prefer `opusplan` when:
- the task is plan-heavy first and execution-heavy second
- a new architecture, workflow, or reporting design is being created
- the session benefits from stronger planning followed by efficient implementation

### Escalation Rules
- if a request starts as low complexity but requires interpretation or tradeoff decisions, escalate from `haiku` to `sonnet`
- if a request starts as medium complexity but reveals major ambiguity, financial risk, or cross-skill conflict, escalate from `sonnet` to `opus`
- if planning quality matters more than immediate execution, prefer `opusplan`

### Subagent Guidance
- use lightweight models for narrow, low-risk subagent tasks when possible
- escalate subagent model usage only when the delegated task requires deeper reasoning

---

## Success Criteria

- business question is translated correctly
- grain is explicitly stated
- scope is clear enough for architect to proceed
- ambiguity is surfaced early instead of buried later