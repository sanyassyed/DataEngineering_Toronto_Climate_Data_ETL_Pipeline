#!/bin/bash
# format: csv or xml
format="csv"
# 48549 is Toronto City Center
stationId=48549 
# option 1
# declare -a year=([0]=2020 [1]=2021 [2]=2023)
# option 2
# year[0]=2020
# year[1]=2021
# year[3]=2023
# option 3
year=(2020 2021 2022)
month=2
day=14
# timeframe 1:hourly data 2:daily data 3:monthly data
# data on this website is only available in the daily format, other formats are not available
timeframe=2 

script_path="$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)"
echo $script_path
# date time
log_date=$(date +"%d-%m-%Y-%H-%M-%S")  

# setting environment variables
# project folder
export PROJECT_FOLDER="${script_path}"
# data folder
export DATA_FOLDER="${PROJECT_FOLDER}/data"
# log folder & file
export LOG_FOLDER="${PROJECT_FOLDER}/log"
export LOG_FILE="${LOG_FOLDER}/${log_date}.log"
# script folder & file
export SCRIPT_FOLDER="${PROJECT_FOLDER}/script"
export SCRIPT_FILE_NAME="trasform.py"
export SCRIPT_FILE="${SCRIPT_FOLDER}/${SCRIPT_FILE_NAME}"

echo "${LOG_FILE} ${SCRIPT_FILE} ${DATA_FOLDER}"


#simple
#website="https://climate.weather.gc.ca/climate_data/bulk_data_e.html?format=${format}&stationID=${stationId}&Year=${year}&Month=${month}&Day=${day}&timeframe=${timeframe}&submit=Download+Data"
# --content-disposition looks into the header for an appropriate file name
#wget --content-disposition ${website}
# to give your own file name
#wget ${website} -O test.csv 

for y in ${year[@]}
do
    website="https://climate.weather.gc.ca/climate_data/bulk_data_e.html?format=${format}&stationID=${stationId}&Year=${y}&Month=${month}&Day=${day}&timeframe=${timeframe}&submit=Download+Data"
    # to supress the download messages and perform download in quiet mode
    wget -q --content-disposition -P "${DATA_FOLDER}/" ${website} 
done