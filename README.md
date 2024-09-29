# Advertising Cost Effectiveness Analysis using One-Way ANOVA

## Project Overview
This project focuses on determining which type of advertisement (TV, Radio, or Newspaper) results in the most cost-effective spending. A one-way ANOVA (Analysis of Variance) test is used to analyze the differences in advertising costs across these three types of advertisements. This analysis provides insights into which advertising medium delivers the best value for money by comparing average costs.

## Dataset Information
- Source: Kaggle - Advertising Dataset
- Variables:
  - `TV`: Advertising budget allocated to TV campaigns (in thousands of dollars).
  - `Radio`: Advertising budget allocated to radio campaigns (in thousands of dollars).
  - `Newspaper`: Advertising budget allocated to newspaper campaigns (in thousands of dollars).
  - `Sales`: Sales generated as a result of the advertising (in thousands of units).

## Project Objectives
1. **Objective**: To determine if there is a statistically significant difference between the average advertising costs across TV, Radio, and Newspaper channels.
   
2. **Method**: Perform a one-way ANOVA to test if there are significant differences in advertising costs across the three categories.
   
3. **Outcome**: Based on the results of the ANOVA and post-hoc tests, the most cost-effective advertising medium will be identified. It will help the company decide which advertising medium provides the most cost-effective solution for their budget.

## Methodology
1. **Data Preparation**
   The dataset is loaded from an Excel file (`AOLdataset.xlsx`) containing columns for advertising costs and the type of advertisement. The costs are analyzed using one-way ANOVA to assess if the average costs differ significantly between TV, Radio, and Newspaper advertising.

2. **One-Way ANOVA Test**
   The one-way ANOVA test checks if there is a significant difference in the mean advertising costs across the three categories. The test follows these hypotheses:
  - **Null Hypothesis (H0)**: There is no difference in the mean advertising costs between the three types of advertisements.
  - **Alternative Hypothesis (H1)**: There is at least one significant difference in the mean advertising costs between the types of advertisements.
  
3. **Post-Hoc Analysis (Tukey HSD)**
   If the ANOVA results are significant (p-value < alpha), a Tukey HSD (Honest Significant Difference) test is performed to determine which specific pairs of advertisement types differ significantly.

4. **Model Adequacy Checking**
Several diagnostic tests are performed to verify that the assumptions of ANOVA are met:
  - **Normality**: Shapiro-Wilk test checks if the residuals are normally distributed.
  - **Homoskedasticity**: Breusch-Pagan test checks if the variance of residuals is constant.
  - **Autocorrelation**: Durbin-Watson test checks for autocorrelation in the residuals.
- 
Additionally, visual diagnostic checks include:
  - **Residual vs Fitted Plo**t: Checks if residuals are randomly scattered around zero.
  - **Q-Q Plot of Residuals**: Assesses if residuals follow a normal distribution.
  - **Residuals vs Factor Levels**: Examines variance consistency across the factor levels (advertisement types).

## Results
1. **ANOVA Test**:
   Significant differences in average advertising costs were found between at least one pair of the advertisement types (p-value < 0.05).
   
2. **Post-Hoc (Tukey HSD)**:
   - TV vs Newspaper: Significant difference (p-value < alpha), indicating TV advertising costs differ from Newspaper advertising costs.
   - TV vs Radio: Significant difference (p-value < alpha), indicating TV advertising costs differ from Radio advertising costs.
   - Radio vs Newspaper: No significant difference (p-value > alpha), indicating Radio and Newspaper advertising costs are similar.

3. **Model Adequacy**:
  - **Normality Test (Shapiro-Wilk)**: The residuals do not follow a normal distribution (p-value < alpha).
  - **Homoskedasticity Test (Breusch-Pagan)**: The residuals show non-constant variance (heteroskedasticity), indicating that the assumption of homoskedasticity is violated.
  - **Autocorrelation Test (Durbin-Watson)**: No significant autocorrelation in the residuals (p-value > alpha).

4. Model Suggestions:
   Due to violations of the normality and homoskedasticity assumptions, it is recommended to consider alternative models such as robust regression or quantile regression for improved accuracy.

## Visualizations
Three key visualizations were produced:
1. **Residual vs Fitted Plot**: Demonstrates heteroskedasticity in the residuals.
2. **Q-Q Plot of Residuals**: Shows that residuals deviate from normal distribution.
3. **Residuals vs Factor Levels**: Confirms non-constant variance across advertisement types.

## Conclusion
- **Most Cost-Effective Medium**: Based on the analysis, TV advertising is significantly different from both Radio and Newspaper in terms of cost. Radio and Newspaper costs are not significantly different.
- **Further Recommendations**: Given the issues with normality and heteroskedasticity, a more advanced regression model like weighted least squares or robust regression is suggested for future analyses.

## Contributors
2501962340 - GREGORY NICOLLA <br>
2502033986 - RADEN MAS BAGUS MAHESA AMANDIRA <br>
2502037864 - SYARANI AFA NATIRA KUSUMAH <br>
2502041615 - YEREMIA ALEXANDER MAROJAHAN PANE
