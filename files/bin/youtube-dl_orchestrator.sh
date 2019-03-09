#!/bin/bash
ps aux |grep youtube-dl_script.sh |grep -v grep |wc -l > /toolbox/app/running.bit
youtubeDL=$(which youtube-dl)
sleep 1;
if [ `cat /toolbox/app/running.bit` -eq "0" ]
then
$youtubeDL -U >out 2>&1 >/dev/null
/toolbox/app/bin/youtube-dl_script.sh /toolbox/app/conf/dl_sources.csv /toolbox/data
fi
