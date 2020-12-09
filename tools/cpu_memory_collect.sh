#!/bin/bash

function GetPID #User #Name
{
    PsUser=$1
    PsName=$2
    pid=`ps -u $PsUser|grep $PsName|grep -v grep|grep -v vi|grep -v dbx | grep -v tail|grep -v start|grep -v stop |sed -n 1p |awk '{print $1}'`
    echo $pid
}

function GetCpu
{
    CpuValue=`ps -p $1 -o pcpu | grep -v CPU | awk '{print $1}'`
    echo $CpuValue
}

function GetMem
{
    MEMUsage=`ps -o vsz -p $1|grep -v VSZ`
    (( MEMUsage /= 1024))
    echo $MEMUsage
}

while true
do
    PID=`GetPID root myapp`
    if [ "-$PID" == "-" ]
    then
        echo "The process does not exist."
        exit
    fi
    cpu=`GetCpu $PID`
    mem=`GetMem $PID`    
    echo "pid:"$PID "," "cpu:" $cpu""%"," "memory:" $mem"M"
    sleep 3s
done