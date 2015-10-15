# rtchibernate

Make linux operating system hibernate automatically after the defined time, after entering sleep/suspend mode.

##Installation

Download file rtchibernate.sh and copy it to /usr/lib/systemd/system-sleep/ directory

`sudo cp rtchibernate.sh /usr/lib/systemd/system-sleep/`

Then apply proper executable permissions to this file 

`sudo chmod +x /usr/lib/systemd/system-sleep/rtchibernate.sh`

And you are done. Next time your laptop goes to suspend it will automatically hibernate after 20 minutes of sleep time.
