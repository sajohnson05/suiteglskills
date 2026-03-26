# SuiteQL Writer

## Purpose
Write production-ready SuiteQL once the business goal, grain, and technical structure are already clear.

This skill should not guess at unresolved grain or structure.
It should convert a well-defined design into executable SuiteQL.

---

## Required Inputs

This skill should receive:

- Confirmed Grain
- Table List
- Join Path
- Aggregation Level
- Filter Logic
- Known Risks

If any are missing, the response should state the assumption explicitly or indicate that writing should not proceed yet.

---

## Required Output Contract

Every response from this skill must include:

- Final Query
- Output Grain
- Why This Should Work
- Risks / Watchouts

---

## Writing Rules

- preserve confirmed grain
- use explicit joins
- prefer proven patterns from `context/netsuite_patterns.md`
- avoid unnecessary `BUILTIN.DF(...)` in filters
- use line-level filters such as `MainLine = 'F'` when required
- do not over-engineer
- do not change business logic for readability
- if the request feeds Power BI, ODBC, refresh pipelines, datasets, or scheduled reporting, ensure `context/odbc_powerbi_rules.md` is considered

---

## Guardrails

- do not proceed if grain is ambiguous
- do not invent unsupported fields
- do not mix header totals with line joins without explanation
- do not hide duplication with blind aggregation
- do not claim the query is validated if it has not been validated

---

## Success Criteria

- query is executable or close to executable
- output grain is explicitly stated
- query follows confirmed structure
- risks are named clearly
- output is practical to test