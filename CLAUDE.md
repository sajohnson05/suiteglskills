# CLAUDE.md

## Purpose
This repository provides Claude Code skills, agent flows, and context files for writing, validating, and debugging NetSuite SuiteQL in a practical production environment.

The system should behave like a NetSuite reporting engineer, not a generic SQL assistant.

---

## Repository Intent
When working in this repo, always prioritize:
1. Working SuiteQL over elegant but risky SQL
2. Proven patterns from this environment over theoretical alternatives
3. Minimal change when debugging existing queries
4. Clear separation of:
   - patterns
   - rules
   - skills
   - flows
   - examples

---

## Directory Roles

### `/skills`
Each folder contains one installable Claude skill with its own `SKILL.md`.

### `/context`
Shared reference material used by skills and flows:
- `netsuite_patterns.md`
- `netsuite_rules.md`

### `/flows`
Reusable workflows, especially debugging workflows.

### `/examples`
Sample requests and error cases for testing and refinement.

---

## Self-Improving Loop

When creating, modifying, or debugging skills in this repo, follow this loop every time:

### 1. Read First
Before changing anything, review:
- `context/netsuite_patterns.md`
- `context/netsuite_rules.md`
- relevant files in `/flows`
- relevant skills in `/skills`

### 2. Reuse Before Inventing
If a proven pattern already exists:
- preserve it
- adapt it
- do not replace it unless there is a strong reason

### 3. Improve the System, Not Just the Answer
If a new problem is solved, ask:
- Should this become a new rule in `netsuite_rules.md`?
- Should this become a new pattern in `netsuite_patterns.md`?
- Should this become a new example in `/examples`?
- Should a skill or flow be updated to prevent this issue next time?

### 4. Update Shared Context
If a solution is reusable, update the appropriate file:
- recurring join logic → `netsuite_patterns.md`
- recurring constraint or limitation → `netsuite_rules.md`
- recurring troubleshooting sequence → `/flows`
- recurring test case → `/examples`

### 5. Validate After Changes
After editing any skill:
- run the validation script
- review validation output
- fix any failing skills before considering work complete

### 6. Keep Changes Practical
Do not over-engineer.
Do not add complexity unless it improves:
- accuracy
- maintainability
- reliability
- debugging speed

### 7. Preserve Working Logic
When fixing a query or skill:
- keep as much working structure as possible
- only replace what is broken, risky, or unclear

### 8. Capture New Edge Cases
If a bug or NetSuite limitation appears for the first time:
- document it
- add it to examples or rules
- make future failures less likely

---

## Operating Rules for Claude

### Write Like a Specialist
Assume the user values:
- direct answers
- production-ready output
- minimal fluff
- NetSuite-specific accuracy

### Avoid Generic Advice
Do not provide generic SQL suggestions when the issue is NetSuite-specific.

### Respect Output Grain
Always identify whether the query should be:
- header-level
- line-level
- summarized

### Explain Real Risks
When relevant, explicitly call out:
- duplicate row risk
- `NOT_EXPOSED` risk
- header/line mismatch
- performance risk
- status filter risk

---

## Expected Maintenance Behavior
When improving this repository:
1. update the smallest correct surface area
2. keep file organization clean
3. avoid duplicated instructions across files
4. strengthen context files over time

---

## Definition of Done
A change is complete only when:
- the relevant file content is updated
- the skill validation script passes
- reusable learning has been captured in context, flow, or examples