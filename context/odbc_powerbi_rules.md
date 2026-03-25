# SuiteQL Rules for ODBC and Power BI

## Purpose
Ensure SuiteQL queries are optimized for extraction into tools like Power BI, Excel, and other reporting layers.

SuiteQL should be designed for:
- efficient data extraction
- stable refresh behavior
- downstream modeling flexibility

NOT for:
- presentation formatting
- heavy transformations

---

## 1. Prefer Raw Fields Over Display Fields

### Avoid:
```sql
BUILTIN.DF(TL.Department)