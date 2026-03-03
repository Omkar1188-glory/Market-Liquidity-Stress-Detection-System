# Market Liquidity Stress Detection System  
### Order Book Microstructure Analysis on 1-Minute BTC Data

---

## 📌 Executive Summary

This project designs and implements a production-oriented **Liquidity Stress Detection Framework** using 1-minute Bitcoin order book microstructure data.

The objective is to quantify real-time liquidity deterioration through a composite scoring system called the **Liquidity Stress Index (LSI)**. The system detects abnormal market conditions, classifies stress regimes, and simulates production deployment through SQL-based aggregation layers.

This framework bridges raw high-frequency market data with actionable risk intelligence.

---

## 💼 Business Problem

High-frequency crypto markets are vulnerable to **flash liquidity droughts**, where spreads widen, order book depth evaporates, and execution risk increases dramatically.

Key risks include:

- Execution fragility and slippage
- Spread widening contagion
- Institutional hedging challenges
- Sudden depth imbalance

Traditional volatility metrics alone are insufficient to detect structural liquidity breakdown.

This project builds a composite stress monitoring system to address that gap.

---

## 📊 Dataset Overview

- **17,113 observations**
- **156 microstructure-related features**
- **1-minute granularity**
- Time period: April 7–19, 2021
- Features include:
  - Midpoint price
  - Bid-ask spread
  - Buy/Sell volumes
  - Order book depth levels

---

## ⚙️ Feature Engineering

### 1️⃣ Spread-Based Liquidity Shock
Rolling 60-minute Z-score of bid-ask spread to detect abnormal widening.

### 2️⃣ Order Flow Imbalance
Captures directional liquidity pressure indicating one-sided book stress.

### 3️⃣ Depth Imbalance
Measures asymmetry between aggregated bid and ask depth (top 5 levels).

All features are standardized and aligned before aggregation.

---

## 📈 Liquidity Stress Index (LSI)

The Liquidity Stress Index is defined as:

LSI = (1 / N) × Σ(Standardized Signals)

Where:
- Each signal is normalized (Z-score)
- Direction is aligned (absolute values where required)
- Final score is averaged into a composite index

LSI rises when multiple microstructure stress signals converge.

---

## 🚦 Stress Regime Classification

Market conditions are categorized into three regimes:

- **Normal** → Healthy liquidity conditions  
- **Warning** → Deteriorating depth requiring monitoring  
- **Critical** → Extreme liquidity stress  

Observed distribution:

- Normal: 12,469 minutes  
- Warning: 4,427 minutes  
- Critical: 217 minutes  

---

## 🔍 Key Insights

- Liquidity stress appears in **clusters**, not isolated events.
- Immediate forward predictive correlation is weak (r ≈ -0.013).
- Critical regimes consistently exhibit the highest average volatility.
- Composite scoring captures structural fragility beyond simple volatility metrics.

---

## 🗄️ Production Integration (SQL Layer)

To simulate real-world deployment:

- Engineered dataset exported to **MySQL**
- Daily summary tables created
- Regime aggregation queries implemented
- Critical minute tracking enabled
- Monitoring-ready structured database designed

Example SQL use cases:
- Daily liquidity health snapshot
- Percentage time spent in critical regime
- Regime-wise volatility comparison

---

## 🛠️ Tech Stack

- Python
- Pandas
- NumPy
- Rolling time-series statistics
- Z-score normalization
- Anomaly detection logic
- MySQL
- SQL aggregation queries
- Composite risk scoring framework design

---

## 📂 Repository Structure

```
market-liquidity-stress-detection/
│
├── data/                # Sample dataset (trimmed)
├── notebooks/           # Jupyter analysis notebook
├── sql/                 # Database schema & queries
├── docs/                # Project documentation & PPT
├── images/              # Visualization outputs
├── README.md
├── requirements.txt
└── LICENSE
```

---

## 🚀 Future Enhancements

- Machine Learning-based regime classification
- Multi-asset validation (ETH, SOL, etc.)
- Real-time API ingestion pipeline
- Alerting system for risk monitoring
- Dashboard layer for desk traders

---

## 🎯 Skills Demonstrated

- Time-series feature engineering
- Market microstructure analytics
- Rolling statistical modeling
- Composite index construction
- Regime classification logic
- SQL production integration
- Risk scoring framework design

---

## 📌 Conclusion

This project demonstrates how raw market microstructure data can be transformed into a structured liquidity monitoring system.  

By combining statistical normalization, composite scoring, and regime classification, the framework provides a scalable foundation for real-time liquidity risk management.

---

## 🧑‍💻 Author

* **Omkar Kadam**
* 📍 Mumbai, India
* 📧 [Omkar78789@gmail.com](mailto:Omkar78789@gmail.com)
* 🔗 LinkedIn: https://www.linkedin.com/in/omkar-kadam-5b493b298/
