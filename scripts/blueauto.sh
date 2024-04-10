#!/bin/bash

if [ $1 = "JBL" ];
then
    if [[ $(bluetoothctl devices Connected | grep "20:64:DE:CC:E0:94") ]];
    then
        bluetoothctl disconnect 20:64:DE:CC:E0:94
    else
        bluetoothctl connect 20:64:DE:CC:E0:94
        pactl set-default-sink bluez_sink.20_64_DE_CC_E0_94.a2dp_sink
    fi
fi
