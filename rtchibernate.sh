#!/bin/bash
# Script name: /usr/lib/systemd/system-sleep/rtchibernate.sh

timestamp=$(date +%s)
autohibernate="1200" ## 20 minutes
echo "$timestamp $1" >> /tmp/autohibernate.log

if [ "$1" = "pre" ]
then
    echo "$timestamp" > /var/run/pm-utils/locks/rtchibernate.lock
    rtcwake -m no -s $autohibernate
fi

if [ "$1" = "post" ]
then
    sustime=$(cat /var/run/pm-utils/locks/rtchibernate.lock)
    rm /var/run/pm-utils/locks/rtchibernate.lock

    if [ $(($curtime - $sustime)) -ge $autohibernate ]
    then
        rm /var/run/pm-utils/locks/pm-suspend.lock
        systemctl hibernate
    else
        rtcwake -m no -s 1
    fi
fi

