/*
Business Question:
Which product categories perform best in terms of pricing, ratings, and review engagement?

Goal:
Compare categories using average price, rating, review count, and engagement signals.

What we measure:
- Average price per category
- Average rating per category
- Average review count per category
- Total products and review penetration
*/

SELECT
  category,

  COUNT(*) AS total_products,

  ROUND(AVG(price), 2) AS avg_price,

  ROUND(AVG(productRating), 2) AS avg_rating,

  ROUND(AVG(countReview), 0) AS avg_reviews,

  COUNTIF(has_reviews = 1) AS products_with_reviews

FROM `amazonfunnel.products_clean.products_clean`

GROUP BY category
ORDER BY avg_reviews DESC;



-- Insight:
-- Wireless headphones significantly outperform other categories in review volume,
-- suggesting higher purchase urgency or stronger product differentiation.
-- Board games show stable engagement with high rating consistency.
-- Coffee beans have the weakest engagement despite equal product distribution,
-- indicating lower review conversion or more passive purchase behavior.


