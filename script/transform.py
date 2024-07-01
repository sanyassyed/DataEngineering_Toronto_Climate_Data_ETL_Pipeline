#!/usr/bin python3

import pandas as pd
import os
import glob

input_path=os.environ['DATA_FOLDER']
output_path=os.environ['OUTPUT_FOLDER']
output_file="all_years.csv"
output_file_path = os.path.join(output_path, output_file)
files=glob.glob(os.path.join(input_path, "*.csv"))

list_of_df = []

for file in files:
    df = pd.read_csv(file, header=0, index_col=None)
    list_of_df.append(df)

df_concat = pd.concat(list_of_df, axis=0, ignore_index=True)
df_concat.to_csv(output_file_path, index=False)