-- Creating Analytica Summary Tables

-- Daily Liquidity Summary Table

CREATE TABLE daily_liquidity_summary AS
SELECT 
    DATE(system_time) AS day,
    COUNT(*) AS total_minutes,
    AVG(LSI) AS avg_lsi,
    MAX(LSI) AS peak_lsi,
    SUM(stress_level = 2) AS critical_minutes,
    SUM(stress_level = 1) AS warning_minutes,
    AVG(abs_return) AS avg_volatility,
    MAX(abs_return) AS peak_volatility
FROM btc_liquidity
GROUP BY DATE(system_time);

-- Why This Is Important
-- This table answers:
-- Which day was most stressed?
-- Did high stress align with high volatility?
-- Was stress concentrated or persistent?

-- Regime Statistics Table

CREATE TABLE regime_statistics AS
SELECT 
    stress_regime,
    COUNT(*) AS minutes,
    AVG(LSI) AS avg_lsi,
    AVG(abs_return) AS avg_volatility,
    MAX(abs_return) AS max_volatility
FROM btc_liquidity
GROUP BY stress_regime;

-- Regime Comparison Table

-- Hour-of-Day Stress Pattern Table

CREATE TABLE hourly_stress_pattern AS
SELECT 
    HOUR(system_time) AS hour_of_day,
    AVG(LSI) AS avg_lsi,
    SUM(stress_level = 2) AS critical_events,
    AVG(abs_return) AS avg_volatility
FROM btc_liquidity
GROUP BY HOUR(system_time)
ORDER BY hour_of_day;

-- This answers:
-- Is liquidity stress time-of-day dependent?



