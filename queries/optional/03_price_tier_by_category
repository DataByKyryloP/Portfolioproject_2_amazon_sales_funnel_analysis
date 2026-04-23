/*
Business Question:
How do price tiers perform within each category?

We compare:
- engagement
- ratings
- demand proxy
across category + price tier combinations
*/

SELECT
  category,
  price_tier,

  COUNT(*) AS total_products,

  ROUND(AVG(price), 2) AS avg_price,

  ROUND(AVG(productRating), 2) AS avg_rating,

  ROUND(AVG(countReview), 0) AS avg_reviews,

  ROUND(AVG(salesVolume_clean), 0) AS avg_sales_volume

FROM `amazonfunnel.products_clean.products_clean`

WHERE price_tier IS NOT NULL

GROUP BY category, price_tier

ORDER BY category, price_tier;

-- Insights:

-- 1. Price tier behavior is strongly category-dependent.
-- The same "budget/mid/premium" label produces very different engagement patterns across categories.

-- 2. Board games show a clear inverse relationship between price and engagement:
-- lower-priced products generate higher review volume, while premium items have fewer reviews but slightly higher ratings.
-- This suggests price sensitivity and strong mass-market appeal.

-- 3. Coffee beans show a weaker and more inconsistent pattern:
-- mid-tier products outperform both budget and premium in both sales volume and reviews,
-- indicating a potential "sweet spot" pricing strategy in this category.

-- 4. Wireless headphones behave differently:
-- mid-tier products dominate in both sales volume and reviews,
-- while budget and premium segments are less efficient in engagement terms.
-- This suggests a strong mid-market preference in consumer electronics.

-- 5. Overall takeaway:
-- There is no universal "best price tier" — performance depends heavily on category context.
-- This supports a segmented pricing strategy rather than a one-size-fits-all model.
