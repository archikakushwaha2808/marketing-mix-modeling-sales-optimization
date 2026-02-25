# Marketing Mix Modeling for Sales Optimization



# 1. Project Objective

The objective of this project is to quantitatively evaluate the impact of different marketing channels (TV, Radio, Newspaper) on product sales and derive data-driven recommendations for optimal budget allocation.

Organizations often invest heavily in multiple advertising channels without clearly understanding which channel delivers the highest incremental return. This project applies statistical modeling and business analysis techniques to:

- Measure the contribution of each marketing channel
- Validate statistical assumptions
- Evaluate return on investment (ROI)
- Provide strategic recommendations for budget reallocation

This project demonstrates a complete analytics workflow from data exploration to business insight generation.



# 2. Dataset Overview

The dataset consists of 200 observations with the following variables:

- **TV** – Advertising spend on TV
- **Radio** – Advertising spend on Radio
- **Newspaper** – Advertising spend on Newspaper
- **Sales** – Units sold

Each record represents marketing investment and corresponding sales performance.



# 3. Exploratory Data Analysis (EDA)

EDA was performed to understand data distribution, relationships, and suitability for regression modeling.



##  3.1 Sales Distribution Analysis

![Sales Distribution](images/sales_distribution.png)

The distribution of Sales appears approximately normal with no extreme skewness or heavy tails. This indicates:

- Sales values are reasonably spread
- No extreme outliers distort the dataset
- Data is suitable for linear regression modeling

A near-normal distribution supports regression assumption validity.



##  3.2 Correlation Heatmap

![Correlation Heatmap](images/correlation_heatmap.png)

The correlation matrix shows:

- **TV and Sales** → Strong positive correlation
- **Radio and Sales** → Strong positive correlation
- **Newspaper and Sales** → Weak correlation

This indicates that increases in TV and Radio spending are strongly associated with increases in Sales, whereas Newspaper spending does not show a strong linear relationship with Sales.



##  3.3 Pairplot Relationship Analysis

![Pairplot](images/pairplot.png)

The pairplot visually confirms:

- Clear upward linear trend between TV and Sales
- Strong upward pattern between Radio and Sales
- Weak and scattered relationship between Newspaper and Sales

This visualization reinforces the correlation findings and supports selection of TV and Radio as significant predictors.



#  4. Regression Modeling

A Multiple Linear Regression model was developed:

Sales = β₀ + β₁(TV) + β₂(Radio) + β₃(Newspaper)

This model estimates the independent effect of each channel on Sales while holding other variables constant.



##  4.1 Model Performance

- R² ≈ 0.89
- Adjusted R² ≈ High explanatory power

Interpretation:

The model explains approximately 89% of the variation in Sales. This indicates that marketing spend across the three channels significantly drives sales performance.



##  4.2 Channel Coefficient Impact

![Channel Impact](images/channel_impact.png)

Coefficient interpretation:

- **Radio** has the highest marginal contribution per unit spend.
- **TV** has strong positive impact.
- **Newspaper** contributes minimally to incremental sales.

This suggests that Radio advertising is the most efficient channel in generating incremental revenue.



# 5. Model Diagnostics and Assumption Testing

Regression assumptions were validated to ensure model reliability.

---

## 5.1 Residual Distribution

![Residual Distribution](images/residual_distribution.png)

Residuals appear approximately normally distributed.

Implication:
The normality assumption is reasonably satisfied, supporting statistical inference validity.



## 5.2 Residuals vs Predicted Plot

![Residual vs Predicted](images/residual_vs_predicted.png)

Residuals show random dispersion with no visible pattern.

Implication:
The linearity assumption holds. There is no systematic bias in predictions.



##  5.3 Homoscedasticity Check

![Homoscedasticity Check](images/homoscedasticity_check.png)

The spread of residuals remains relatively constant across predicted values.

Implication:
The homoscedasticity assumption is satisfied. Variance is stable across prediction range.



#  6. Excel Business Intelligence Dashboard

An executive-level dashboard was developed in Excel to communicate insights visually.

The dashboard includes:

- Total Sales KPI
- Total Marketing Spend KPI
- Average Sales KPI
- Channel ROI Comparison
- Correlation Visualization
- Marketing Mix Distribution
- Spend Segmentation Analysis



## 6.1 Marketing Mix Distribution

The pie chart indicates:

- TV accounts for approximately 73% of total marketing budget.
- Radio and Newspaper account for significantly smaller shares.

This suggests a heavy budget concentration on TV.



##  6.2 Channel ROI Comparison

ROI analysis reveals:

- Radio delivers the highest return per unit of spend.
- Newspaper delivers the lowest ROI.
- TV provides moderate but stable return.

This indicates potential budget reallocation opportunity toward higher-efficiency channels.



##  6.3 Spend Segmentation Analysis

Sales performance was analyzed across different levels of TV spend (High, Medium, Low).

Findings show:

- Higher TV investment levels correspond to higher average sales.
- The investment-performance relationship is positively aligned.

This supports strategic TV investment optimization rather than reduction.



#  7. SQL Analysis

SQL was used to perform:

- Descriptive statistics (AVG, STDDEV, VARIANCE)
- ROI computation
- Spend segmentation
- Correlation approximation
- Window functions (Ranking, Running Total)
- Outlier detection using Z-score logic

This demonstrates database-level analytical capability.



#  8. Strategic Business Recommendations

1. Increase allocation toward Radio due to highest marginal contribution and ROI.
2. Maintain optimized TV strategy given strong correlation with Sales.
3. Re-evaluate Newspaper allocation due to weak statistical contribution.
4. Implement ongoing regression-based monitoring of campaign performance.
5. Transition toward data-driven marketing allocation strategy.



#  9. Conclusion

This project demonstrates:

1. Statistical modeling expertise  
2. Regression analysis  
3. Assumption validation  
4. ROI evaluation  
5. Business dashboard development  
6. Strategic marketing insight generation  

The results highlight the importance of data-driven marketing decisions and efficient capital allocation across advertising channels.


