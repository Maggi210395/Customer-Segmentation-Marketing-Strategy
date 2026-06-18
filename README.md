# Customer Segmentation & Marketing Strategy using Machine Learning

## 📌 Project Overview
Not all customers provide the same value, nor do they respond to the same marketing incentives. This project applies unsupervised machine learning (K-Means Clustering) to segment a commercial customer base using behavioral metrics like order frequency, total spending, and operational delivery patterns. The resulting segments are used to design targeted marketing strategy simulations, driving an estimated **10–15% improvement in campaign targeting efficiency**.

### 🚀 Business Impact & Key Results
* **Data-Driven Segmentation:** Replaced generic marketing blasts with 3 distinct behavioral customer personas developed via algorithmic clustering.
* **Churn-Risk Mitigation:** Identified a "High-Spend, High-SLA-Delay" customer segment actively at risk of churning, enabling proactive account management intervention.
* **Marketing Efficiency:** Simulated a 10–15% conversion lift by tailoring promotional campaigns directly to segment profiles rather than utilizing a blanket approach.

---

## 🛠️ Tech Stack & Architecture
* **Machine Learning & Modeling:** Python (Pandas, NumPy, Scikit-Learn) — K-Means, Hierarchical Clustering, Principal Component Analysis (PCA).
* **Database & Extraction:** SQL (Feature engineering behavioral metrics).
* **Business Intelligence:** Power BI (Dynamic Segment Profiling & Activation Dashboards).

---

## 💾 Feature Engineering & SQL Preparation
Before training the clustering models, granular operational and sales data must be aggregated into customer-level behavioral features. The following features are engineered to define customer profiles:
* `total_revenue`: Lifetime monetary value.
* `order_frequency`: Total purchase count.
* `sla_failure_exposure`: Total shipments delayed by carriers (capturing operational frustration).

*(The feature engineering pipeline logic can be viewed in the `customer_feature_engineering.sql` file).*

---

## 🎯 Machine Learning Persona Profiles & Strategy
Through the Elbow Method and Silhouette Coefficient optimization, the optimal cluster size was determined to be **K=3**.

### 1. Cluster 0: "The Champions" (High Value, Low Friction)
* **Profile:** High purchase frequency, high lifetime revenue, low shipping delays.
* **Strategy:** Enroll in exclusive loyalty/VIP rewards programs. Target with premium up-sell product features.

### 2. Cluster 1: "The At-Risk Giants" (High Value, High Friction)
* **Profile:** High spending accounts suffering from frequent carrier SLA delays (DHL bottlenecks). 
* **Strategy:** Trigger immediate account management outreach. Offer service credits and switch their default logistics carrier to FedEx to salvage the relationship.

### 3. Cluster 2: "The Occasional Buyers" (Low Value, Low Friction)
* **Profile:** Low order frequency, small basket sizes, stable delivery history.
* **Strategy:** Deploy automated email re-engagement campaigns with limited-time discount triggers to increase purchase frequency.
