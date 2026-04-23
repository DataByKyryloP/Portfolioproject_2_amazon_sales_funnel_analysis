/*
Business Question:
Which product categories convert product visibility into engagement most efficiently?

We measure:
- average reviews per product
- review density (engagement intensity)
- sales volume proxy
*/

SELECT
  category,

  COUNT(*) AS total_products,

  ROUND(AVG(countReview), 0) AS avg_reviews,

  ROUND(AVG(review_density), 2) AS avg_review_density,

  ROUND(AVG(salesVolume_clean), 0) AS avg_sales_volume,

  COUNTIF(has_reviews = 1) AS reviewed_products

FROM `amazonfunnel.products_clean.products_clean`

GROUP BY category
ORDER BY avg_review_density DESC;



-- Insights:

-- 1. Wireless headphones show the highest engagement efficiency across all categories,
-- indicating strong consumer interaction and high interest per product.

-- 2. Board games exhibit moderate engagement levels but consistent review activity,
-- suggesting a stable, community-driven purchasing behavior.

-- 3. Coffee beans show the lowest review density despite relatively strong sales volume,
-- which suggests passive consumption behavior (purchases happen frequently, but users rarely leave feedback).

-- 4. Overall, engagement intensity varies significantly by category,
-- confirming that review behavior is strongly tied to product type rather than just popularity or sales volume.

-- 5. This highlights that "reviews per product" is not a universal metric,
-- but a category-dependent behavioral signal.
