#!/bin/bash
if [ $# != 7 ]; then
    echo "Usage: $0 port paswd oltp-count-size num-threads max-time table-count database"
    exit 1
fi
port=$1
passwd=$2
oltpSize=$3
numThreads=$4
maxTime=$5
tableC=$6
database=$7
testLua="./db/oltp.lua"
./sysbench --test=${testLua}  \
         --mysql-host=$MYSQL_HOST --mysql-port=${port} --mysql-user=root --mysql-password=${passwd} \
         --mysql-db=${database} --oltp-tables-count=${tableC} --mysql-table-engine=innodb --oltp-table-size=${oltpSize} \
         --report-interval=60 --max-requests=1000000000 \
         --oltp-read-only=off  --oltp-test-mode=nontrx --num-threads=${numThreads} \
         --max-time=${maxTime} \
         run


