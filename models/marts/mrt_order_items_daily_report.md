{% docs mrt_order_items_daily_report %}

This model provides a daily aggregated summary of order items, at the grain of one row per day. It includes the following metrics:

- **Total gross revenue**: total revenue before discount.
- **Total net revenue**: total revenue after discount.
- **Total discount amount**: total value of discounts applied.
- **Total units sold**: total number of units sold.
- **Total orders**: number of distinct orders placed.
- **Average order value**: average net revenue per order (total net revenue / total orders).

{% enddocs %}