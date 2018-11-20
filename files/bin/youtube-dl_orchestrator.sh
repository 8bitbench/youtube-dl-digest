#!/bin/bash
ps aux |grep youtube-dl_script.sh |grep -v grep |wc -l > /toolbox/app/running.bit
#!/bin/bash
sleep 1;
if [ `cat /toolbox/app/running.bit` -eq "0" ]
then
/toolbox/app/bin/youtube-dl_script.sh /toolbox/app/conf/dl_sources.csv /toolbox/data
fi
