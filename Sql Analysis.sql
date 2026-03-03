CREATE DATABASE liquidity_project;

use liquidity_project;

select count(*) from btc_liquidity;

select min(system_time), max(system_time)
from btc_liquidity;

-- Stress Distribution

select 
	stress_regime,
    count(*) as minutes,
    round(100*count(*) / (select count(*) from btc_liquidity), 2) as percentage
from btc_liquidity
group by stress_regime
order by minutes desc;

-- Volatility by Regime

select 
	stress_regime,
    avg(abs_return) as avg_volatility,
    max(abs_return) as max_volatility
from btc_liquidity
group by stress_regime
order by avg_volatility desc;

-- Daily Liquidity Stress Monitoring

select 
	date(system_time) as day,
    avg(LSI) as avg_lsi,
    max(LSI) as peak_lsi,
    sum(stress_level = 2) as critical_minutes
from btc_liquidity
group by date(system_time)
order by day;

-- Extreme Stress Event Detection

select * from btc_liquidity
where stress_level = 2
order by LSI desc
limit 10;

-- Rolling Window in SQL

select
	system_time,
    LSI,
    avg(LSI) over (
		order by system_time
        rows between 14 preceding and current row
        ) as LSI_15Mins_avg
from btc_liquidity;

-- Longest Consecutive Stress Period

select system_time, stress_level
from btc_liquidity
where stress_level = 2
order by system_time;

-- Pre-Stress Volatility Increase

select 
	 a.system_time as critical_time,
     avg(b.abs_return) as avg_vol_before
from btc_liquidity a
join btc_liquidity b
	on b.system_time between 
		date_sub(a.system_time, INTERVAL 10 MINUTE)
        and a.system_time
where a.stress_level = 2
group by a.system_time;

-- Check volatility 10 minutes before critical stress.

-- Stress vs Spread Expansion

select 
	 stress_regime,
     avg(spread) as avg_spread,
     max(spread) as max_spread
from btc_liquidity
group by stress_regime;

-- Top 20 Liquidity Breakdown Events

select 
	 system_time,
     spread,
     LSI,
     abs_return
from btc_liquidity
order by LSI desc
limit 20;

-- Rolling 30-Min Stress Accumulation

select 
	system_time,
    sum(stress_level) over (
		order by system_time
        rows between 29 preceding and current row
        ) as stess_accum_30mins
from btc_liquidity;

-- This shows clustering of stress.