#!/bin/bash

cd raw_data

# Extract top 10 highest temperatures
head -n 1 satelite_temperature_data.csv | cut -d, -f1-3 > ../analyzed_data/highest_temp.csv
sort -t, -k3 -nr satelite_temperature_data.csv | head -n 10 | cut -d, -f1-3 >> ../analyzed_data/highest_temp.csv

# Extract humidity data for Mauritius
head -n 1 satelite_temperature_data.csv | cut -d, -f1,2,4 > ../analyzed_data/humidity_data_Mauritius.csv
grep "Mauritius" satelite_temperature_data.csv | sort -t, -k4 -nr | cut -d, -f1,2,4 >> ../analyzed_data/humidity_data_Mauritius.csv

echo "Data analysis completed successfully!"
