/*
Business Question:
Does discounting improve engagement and perceived product quality?

We compare discounted vs non-discounted products across engagement metrics.
*/

SELECT
  is_discounted,

  COUNT(*) AS total_products,

  AVG(price) AS avg_price,
  AVG(productRating) AS avg_rating,
  AVG(countReview) AS avg_reviews,
  AVG(salesVolume_clean) AS avg_sales_volume

FROM `amazonfunnel.products_clean.products_clean`

GROUP BY is_discounted;
