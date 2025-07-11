

import pandas as pd
import statsmodels.formula.api as smf
from linearmodels.panel import PanelOLS

# Load the dataset
detail_data = pd.read_csv('Detailing_Case_Data.csv')

# Summary Statistics
print("Summary Statistics:")
print(detail_data.describe())

# Correlation between 'scripts' and 'detailing'
correlation = detail_data['scripts'].corr(detail_data['detailing'])
print(f"\nCorrelation between 'scripts' and 'detailing': {correlation}")

# Univariate Regression: scripts ~ detailing
print("\nUnivariate Regression: scripts ~ detailing")
uni_model = smf.ols('scripts ~ detailing', data=detail_data).fit()
print(uni_model.summary())

# Multivariate Regression: scripts ~ detailing + lagged_scripts + mean_samples
print("\nMultivariate Regression: scripts ~ detailing + lagged_scripts + mean_samples")
multi_model = smf.ols('scripts ~ detailing + lagged_scripts + mean_samples', data=detail_data).fit()
print(multi_model.summary())

# Regression with Categorical Variables: Adding doctorType
print("\nRegression with Categorical Variables: scripts ~ detailing + lagged_scripts + mean_samples + doctorType")
cat_model = smf.ols('scripts ~ detailing + lagged_scripts + mean_samples + C(doctorType)', data=detail_data).fit()
print(cat_model.summary())

# Interaction Effects: scripts ~ detailing * doctorType + lagged_scripts + mean_samples
print("\nRegression with Interaction Effects: scripts ~ detailing * doctorType + lagged_scripts + mean_samples")
interaction_model = smf.ols('scripts ~ detailing * C(doctorType) + lagged_scripts + mean_samples', data=detail_data).fit()
print(interaction_model.summary())

# Fixed Effects Regression
print("\nFixed Effects Regression with doctorID as Entity Effects")
# Assuming the dataset has a time variable for panel setup
if 'time' not in detail_data.columns:
    detail_data['time'] = range(len(detail_data))  # Dummy time column if not present
detail_data['doctorID'] = detail_data['doctorID'].astype('category')  # Ensure doctorID is categorical
detail_data['doctorID_int'] = detail_data['doctorID'].cat.codes  # Convert to integer for grouping
detail_data = detail_data.set_index(['doctorID_int', 'time'])

fixed_effects_model = PanelOLS.from_formula(
    'scripts ~ detailing + lagged_scripts + mean_samples + '
    'detailing:C(doctorType) + EntityEffects', 
    data=detail_data
).fit()
print(fixed_effects_model.summary)
