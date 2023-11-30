#!/bin/bash

bandwidth=100000

tc qdisc add dev eth0 root handle 1:0 netem delay 100ms reorder 5% 50% limit 1000000
tc qdisc add dev eth0 parent 1:0 handle 2:0 htb default 1
tc class add dev eth0 parent 2:0 classid 2:1 htb rate $bandwidth

while true; do
    random_number=$((1 + RANDOM % 10))

    if [ "$random_number" -ge 1 ] && [ "$random_number" -lt 7 ]; then
	bandwidth=$((bandwidth * 2 / 3))
    else
	bandwidth=$((bandwidth / 2))
    fi

    if [ $bandwidth -lt 3125 ]; then
	bandwidth=100000
    fi

    tc class change dev eth0 parent 2:0 classid 2:1 htb rate $bandwidth ceil $bandwidth
    sleep 1
done

