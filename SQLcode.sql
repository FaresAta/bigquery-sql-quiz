-- This query shows a list of the daily top Google Search terms.
SELECT
 refresh_date AS Day,
 term AS Top_Term,
 rank as rank,
 week as week,
 dma_name as region,
 term as term
FROM `bigquery-public-data.google_trends.top_terms`
WHERE
 rank in (1, 2, 3)
 -- Choose only the top term each day.
 AND refresh_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 month)
 -- Filter to the last 2 weeks.
GROUP BY Day, Top_Term, rank, week, region
ORDER BY Day DESC
 -- Show the days in reverse chronological order.