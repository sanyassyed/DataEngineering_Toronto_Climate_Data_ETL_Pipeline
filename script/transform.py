#!/usr/bin python3

import pandas as pd
import os
import glob
import logging

def main() -> None:
    log_file = os.environ['LOG_FILE_PYTHON']
    input_path=os.environ['DATA_FOLDER']
    output_path=os.environ['OUTPUT_FOLDER']
    output_file="all_years.csv"
    output_file_path = os.path.join(output_path, output_file)
    files=glob.glob(os.path.join(input_path, "*.csv"))

    logging.basicConfig(
                        level=logging.DEBUG,
                        format="%(asctime)s %(levelname)s : %(message)s",
                        datefmt="%Y-%m-%d %H:%M:%S",
                        filename=log_file,)
    
    logging.info(f"LOG FILE FOR PYTHON SCRIPT AT: {log_file}")
    

    list_of_df = []

    for file in files:
        df = pd.read_csv(file, header=0, index_col=None)
        list_of_df.append(df)

    df_concat = pd.concat(list_of_df, axis=0, ignore_index=True)
    logging.info("WRITING CONCATENATED FILE TO DISK")
    df_concat.to_csv(output_file_path, index=False)
    logging.info(f"FILE WRITTEN TO {output_file_path}")

if __name__== "__main__":
    main()