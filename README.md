# Toronto Climate Data ETL Pipeline
This project does the following
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
## Running the ETL
Use the following commands to run the ETL Pipeline
```bash
    conda activate ./.my_exe
    sudo chmod 777 script/extract.sh
    ./script/extract.sh
```