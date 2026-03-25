# NetSuite SuiteQL Rules and Constraints

This file defines known constraints and best practices for writing SuiteQL in this environment.

---

## 1. Field Exposure Rules

### Avoid Direct Fields on Transaction
Do NOT assume these exist:
- Transaction.shipstate
- Transaction.shipcity
- Transaction.shipzip

### Use Shipping Address Table Instead
```sql
LEFT JOIN TransactionShippingAddress TSA
    ON Transaction.ShippingAddress = TSA.nkey