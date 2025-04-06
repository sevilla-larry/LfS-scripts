# a.08.93.0.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.93.01.ntp-4.2.8p17"
echo "08.93.01.ntp-4.2.8p17" >> $LFSLOG_PROCESS

time { bash a.08.93.01.ntp-4.2.8p17.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.93.02.WGet-1.21.4"
echo "08.93.02.WGet-1.21.4" >> $LFSLOG_PROCESS

time { bash a.08.93.02.WGet-1.21.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.93.03.Lynx-2.8.9rel.1"
echo "08.93.03.Lynx-2.8.9rel.1" >> $LFSLOG_PROCESS

time { bash a.08.93.03.Lynx-2.8.9rel.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.93.04.cURL-8.6.0"
echo "08.93.04.cURL-8.6.0" >> $LFSLOG_PROCESS

time { bash a.08.93.04.cURL-8.6.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.93.05.Git-2.41.0"
echo "08.93.05.Git-2.41.0" >> $LFSLOG_PROCESS

time { bash a.08.93.05.Git-2.41.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
