#!/bin/bash

devices=$(bluetoothctl devices Connected | wc -l)

if [[ $devices = 1 ]];
then
    echo ""
else
    echo ""
fi
