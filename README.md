# Toronto Climate Data ETL Pipeline
This project extracts the climate data for the specified station id for the specified years, transforms it, concatenates it and loads it into a single csv file.
## ETL Steps
### Extract
* Uses bash script at [./script/extract.sh](./script/extract.sh) to     
    * Pull climate data from [climate.weather.gc.ca](https://climate.weather.gc.ca) for the year 2020 2021 2022 and 
    * Downloads data for each year it into the `data` folder as seperate csvs
    * Calls the Python transform script in [script/transform.py](./script/transform.py)
### Transform & Load
* The transform python script does the following
    * Pulls all the csv files for all years
    * Joins the data from all years into one dataframe and loads/writes to the file `output/all_years.csv`

## Architecture
![ETL Pipeline](./TorontoClimateDataETL.drawio.pdf)

## Running the ETL
Use the following commands to run the ETL Pipeline
```bash
    # activate the virtual environment
    conda activate ./.my_exe
    # change the permissions of the extract file so it can be executed
    sudo chmod 777 script/extract.sh
    # run the bash script to run the ETL pipeline
    ./script/extract.sh
```
