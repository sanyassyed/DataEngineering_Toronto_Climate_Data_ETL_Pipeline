#!/bin/bash
# format csv or xml

format="csv"
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
timeframe=2 



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
    wget -q --content-disposition ${website}
done