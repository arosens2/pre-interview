#!/bin/sh

cd  ~/pre_interview/cvc5-macOS-arm64-static/bin
touch queries_data.csv
echo "QueryName,Result,ElapsedTime" > quieries_data.csv;
for i in "/Users/abbyrosenstein/pre_interview/queries"/*; 
do 
    echo "$(basename "$i")," 
    start=$(date +%s%3N)
    ./cvc5 $i --tlimit 60000
    end=$(date +%s%3N)
    (echo "$end - $start" | bc)
done >> queries_data.csv
mv queries_data.csv ~/pre_interview
cd ~/pre_interview 