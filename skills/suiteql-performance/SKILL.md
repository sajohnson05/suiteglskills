# SuiteQL Performance Optimizer

## Purpose
Improve performance, efficiency, and scalability of SuiteQL queries for NetSuite and downstream tools like Power BI.

## Focus Areas

1. Reduce Row Volume Early
- Apply filters as early as possible
- Use date filters and transaction type filters first

2. Minimize BUILTIN.DF
- Avoid in WHERE clause
- Reduce in large datasets
- Use only when needed for output readability

3. Optimize Joins
- Remove unnecessary joins
- Avoid joining large tables before filtering
- Prefer line-level filtering before expansion

4. Control Grain
- Avoid mixing header totals with line joins
- Ensure correct aggregation

5. Avoid Duplication
- Identify one-to-many joins
- Reduce duplication before aggregation

6. Power BI / ODBC Considerations
- Prefer raw IDs for joins downstream
- Avoid heavy text transformations
- Keep dataset size manageable

## Optimization Techniques

- Move filters upstream
- Replace BUILTIN.DF in filters with raw fields
- Remove unused columns
- Simplify CASE statements when possible
- Use line filters (`MainLine = 'F'`) correctly

## Output Format

- Performance Issues Found
- Optimized Query
- What Changed
- Expected Impact

## Success Criteria
- Query runs faster
- Reduced row count early
- Lower memory/compute load
- Safer for ODBC / Power BI refresh