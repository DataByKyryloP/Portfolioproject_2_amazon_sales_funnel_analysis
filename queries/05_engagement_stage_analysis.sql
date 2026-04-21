/*
Business Question:
How do products perform across different engagement maturity stages?

We segment products into:
- no reviews
- low engagement
- high engagement
*/

WITH segmented AS (
  SELECT *,
    CASE
      WHEN countReview = 0 THEN 'no_reviews'
      WHEN countReview BETWEEN 1 AND 1000 THEN 'low_reviews'
      ELSE 'high_reviews'
    END AS review_segment
  FROM `amazonfunnel.products_clean.products_clean`
)

SELECT
  review_segment,

  COUNT(*) AS total_products,

  AVG(price) AS avg_price,
  AVG(productRating) AS avg_rating,
  AVG(countReview) AS avg_reviews,
  AVG(salesVolume_clean) AS avg_sales_volume

FROM segmented
GROUP BY review_segment;





/*
Insight Summary:

1. Product performance is highly concentrated in the "high_reviews" segment,
   which contains the majority of products (~160+), indicating that most listings
   eventually accumulate meaningful engagement.

2. High-review products show dramatically stronger performance across all metrics:
   higher ratings (~4.60), significantly higher review counts (~14K avg),
   and stronger sales volume (~5.7K avg).

3. Low-review products represent a weak-performing segment,
   with minimal engagement and very low sales volume (~1.1K),
   suggesting early-stage or low-visibility products.

4. There is a clear performance gap between high and low engagement products,
   indicating that review accumulation is strongly correlated with both demand and perceived quality.

5. Overall conclusion:
   Product success is not evenly distributed — a small segment of highly engaged products
   drives the majority of platform activity.
*/


