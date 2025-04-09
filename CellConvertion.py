import pandas as pd
from pathlib import Path

#to convert cell count in cell-count.csv to relative frequency (in percentage)
# of total cell count for each sample. Total cell count of each sample is the
# sum of cells in the five populations of that sample.

# Input and output paths
inputFile = Path('cell-count.csv')
outputFile = Path('cell-count-result.csv')

# Read the input data
df = pd.read_csv(inputFile)

# List of cell populations
cell_populations = ['b_cell', 'cd8_t_cell', 'cd4_t_cell', 'nk_cell', 'monocyte']

# Calculate total count for each sample
df['total_count'] = df[cell_populations].sum(axis=1)

# Melt the dataframe to long format
melted_df = df.melt(
    id_vars=['sample', 'total_count'],
    value_vars=cell_populations,
    var_name='population',
    value_name='count'
)
#sample: the sample id as in column sample in cell-count.csv
#total_count: total cell count of sample
#population: name of the immune cell population (e.g. b_cell, cd8_t_cell, etc.)
#count: cell count
#percentage: relative frequency in percentage

# Calculate percentage
melted_df['percentage'] = (melted_df['count'] / melted_df['total_count']) * 100

# Select and order the desired columns
result_df = melted_df[['sample', 'total_count', 'population', 'count', 'percentage']]

# Round percentages to 2 decimal places
result_df['percentage'] = result_df['percentage'].round(2)

# Save it to cvs
result_df.to_csv(outputFile, index=False)
