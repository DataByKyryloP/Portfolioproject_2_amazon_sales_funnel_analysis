/*
Business Question:
How do product performance metrics vary across price tiers and categories?

Approach:
1. Build a cleaned base dataset
2. Aggregate by category + price tier
3. Compare engagement and demand signals
*/

WITH base AS (
  SELECT
    category,
    price_tier,
    price,
    productRating,
    countReview,
    salesVolume_clean,
    has_reviews
  FROM `amazonfunnel.products_clean.products_clean`
  WHERE price_tier IS NOT NULL
),

aggregated AS (
  SELECT
    category,
    price_tier,

    COUNT(*) AS total_products,

    ROUND(AVG(price), 2) AS avg_price,
    ROUND(AVG(productRating), 2) AS avg_rating,
    ROUND(AVG(countReview), 2) AS avg_reviews,
    ROUND(AVG(salesVolume_clean), 2) AS avg_sales_volume

  FROM base
  GROUP BY category, price_tier
)

SELECT *
FROM aggregated
ORDER BY category, price_tier;


/*
Insight Summary:

1. Price-tier effects are highly category-dependent rather than universal.
   Each category shows a different relationship between price and engagement.

2. Board games show a clear inverse relationship between price and demand:
   budget products generate the highest review volume (~18K avg reviews),
   while premium products drop significantly (~6.5K avg reviews),
   suggesting strong price sensitivity and mass-market appeal.

3. Coffee beans show a non-linear pattern:
   mid-tier products outperform both budget and premium in both sales volume and reviews,
   indicating a "sweet spot" pricing strategy rather than linear price elasticity.

4. Wireless headphones show a different structure:
   mid-tier products dominate both sales volume (~7.6K) and reviews (~36K),
   while budget and premium segments underperform in comparison.
   This suggests a strong mid-market preference in consumer electronics.

5. Ratings remain relatively stable across all tiers (~4.4–4.7),
   indicating that price does not strongly influence perceived quality,
   but strongly influences engagement and demand behavior.

6. Overall conclusion:
   There is no universal optimal price tier — pricing effectiveness is category-specific,
   reinforcing the need for segmented pricing strategies rather than global assumptions.
*/




