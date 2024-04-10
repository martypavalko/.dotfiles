if [[ $1 -eq '1' ]]; then
    pkill picom
    picom -b --config=$HOME/.config/picom/picom.conf --active-opacity=1 &
elif [[ $1 -eq '0' ]]; then
    pkill picom
    picom -b --config=$HOME/.config/picom/picom.conf &
else
    echo 'Fail'
fi
