WITH customer_orders AS (
    SELECT
        CustomerID,
        COUNT(DISTINCT InvoiceNo) AS order_count
    FROM online_retail
    WHERE CustomerID IS NOT NULL
    GROUP BY CustomerID
)
SELECT
    CASE 
        WHEN order_count = 1 THEN 'One-time'
        ELSE 'Repeat'
    END AS customer_type,
    COUNT(*) AS num_customers
FROM customer_orders
GROUP BY 1;
