# Reconciliation Cases

## Purpose
These examples help test and improve reconciliation behavior.

They are meant to make the system more reliable over time.

---

## Case 1: Invoice Header Total vs Invoice Line Sum

### Business Question
Does the invoice header amount tie to the sum of invoice lines?

### Expected Behavior
- define comparison as header vs aggregated line detail
- exclude tax or mainline rows as appropriate
- explain any difference caused by tax, shipping, or non-item lines

---

## Case 2: PO Amount vs Related Vendor Bills

### Business Question
Do purchase orders tie to the vendor bills created from them?

### Expected Behavior
- use line-level linkage carefully
- identify partial billing situations
- warn that one PO may link to multiple bills

---

## Case 3: Saved Search vs SuiteQL

### Business Question
Why does the saved search total not match the SuiteQL result?

### Expected Behavior
- compare filters exactly
- compare status handling exactly
- check role permissions
- identify whether the variance is logic, filter, or visibility related

---

## Case 4: NetSuite Report vs Power BI Dataset

### Business Question
Why does Power BI not tie to NetSuite?

### Expected Behavior
- compare source query vs report logic
- check date field used in each source
- check refresh timing
- check whether Power BI is using raw IDs or display values incorrectly

---

## Case 5: Backlog Report vs Open PO Logic

### Business Question
Does the backlog report align with open purchase orders not yet billed?

### Expected Behavior
- define backlog logic clearly
- confirm whether the comparison is based on status, quantity billed, or both
- explain timing differences and partially billed lines

---

## Case 6: Transaction Total Overstated

### Business Question
Why is the total overstated after joining lines?

### Expected Behavior
- identify header/line mismatch
- explain duplication source
- correct the grain before recalculating total

---

## Case 7: MCP Validation

### Business Question
Does the query match the values the team sees in NetSuite today?

### Expected Behavior
- state the reference source
- state that live environment validation was used
- report variance clearly
- separate validated fact from interpretation

---

## Pass Standard

A reconciliation case is handled well when the system:
- defines the pair being reconciled
- defines the grain
- identifies the correct filters
- explains variance clearly
- recommends a practical next step