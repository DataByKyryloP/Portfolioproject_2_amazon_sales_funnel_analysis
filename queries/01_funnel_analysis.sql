/*
Business Question:
How does product visibility translate into engagement across the Amazon product funnel?

Goal:
Measure drop-off from listed products → rated → reviewed → high engagement products
*/

SELECT
  COUNT(*) AS total_products,

  COUNT(productRating) AS products_with_rating,

  COUNTIF(countReview >= 50) AS products_50_reviews,

  COUNTIF(countReview >= 500) AS products_500_reviews,

  COUNTIF(has_reviews = 1) AS products_with_any_reviews

FROM `amazonfunnel.products_clean.products_clean`
