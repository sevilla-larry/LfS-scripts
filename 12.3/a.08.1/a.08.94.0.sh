# a.08.94.0.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.94.01.ntp-4.2.8p18"
echo "08.94.01.ntp-4.2.8p18" >> $LFSLOG_PROCESS

time { bash a.08.94.01.ntp-4.2.8p18.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.94.02.WGet-1.25.0"
echo "08.94.02.WGet-1.25.0" >> $LFSLOG_PROCESS

time { bash a.08.94.02.WGet-1.25.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.94.03.Lynx-2.9.2"
echo "08.94.03.Lynx-2.9.2" >> $LFSLOG_PROCESS

time { bash a.08.94.03.Lynx-2.9.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.94.04.cURL-8.12.1"
echo "08.94.04.cURL-8.12.1" >> $LFSLOG_PROCESS

time { bash a.08.94.04.cURL-8.12.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.94.05.Git-2.48.1"
echo "08.94.05.Git-2.48.1" >> $LFSLOG_PROCESS

time { bash a.08.94.05.Git-2.48.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
