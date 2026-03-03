-- Creating View For Tableau

-- Clean Tableau View

CREATE OR REPLACE VIEW tableau_liquidity_view AS
SELECT 
    system_time,
    DATE(system_time) AS day,
    HOUR(system_time) AS hour_of_day,
    midpoint,
    spread,
    LSI,
    stress_level,
    stress_regime,
    abs_return
FROM btc_liquidity;

-- (This gives Tableau:
-- 	Time dimension
-- 	Day dimension
-- 	Hour dimension
-- 	Liquidity metrics
-- 	Regime classification)

-- Daily Summary View

CREATE OR REPLACE VIEW tableau_daily_summary AS
SELECT 
    DATE(system_time) AS day,
    COUNT(*) AS total_minutes,
    AVG(LSI) AS avg_lsi,
    MAX(LSI) AS peak_lsi,
    SUM(stress_level = 2) AS critical_minutes,
    AVG(abs_return) AS avg_volatility,
    MAX(abs_return) AS peak_volatility
FROM btc_liquidity
GROUP BY DATE(system_time);

-- (This is for:
-- KPI cards
-- Bar charts
-- Daily comparison)

-- Hourly Pattern View

CREATE OR REPLACE VIEW tableau_hourly_pattern AS
SELECT 
    HOUR(system_time) AS hour_of_day,
    AVG(LSI) AS avg_lsi,
    SUM(stress_level = 2) AS critical_events,
    AVG(abs_return) AS avg_volatility
FROM btc_liquidity
GROUP BY HOUR(system_time);

-- (This is perfect for:
-- Heatmaps
-- Time-of-day stress charts)

