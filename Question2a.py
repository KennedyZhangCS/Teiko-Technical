import pandas as pd
import matplotlib.pyplot as plt


#1. filter the data: we want subsets melanoma patients,
#treatment == tr1, only PBMC samples, and patients with response (y or n)

# Load and preprocess data
df = pd.read_csv('cell-count.csv')
cell_populations = ['b_cell', 'cd8_t_cell', 'cd4_t_cell', 'nk_cell', 'monocyte']

# Filter for PBMC samples from melanoma patients with tr1 treatment
analysis_df = df[(df['condition'] == 'melanoma') &
                 (df['treatment'] == 'tr1') &
                 (df['sample_type'] == 'PBMC')].copy()

#I'm a little lost on the next part of the code, but my logic is that next
#we should calculate the relative frequency and then generate the boxplot

#label the boxplot
plt.title('Cell Population Frequencies: Responders vs Non-Responders (tr1 Melanoma PBMC)')
plt.ylabel('Relative Frequency (%)')
plt.xlabel('Cell Population')
plt.close()

