# a.08.00.Part6.92-92Z.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.92.NTP"
echo "08.92.NTP" >> $LFSLOG_PROCESS

bash a.08.92.NTP.sh ;

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.92A.Net-SSLeay-1.94"
echo "08.92A.Net-SSLeay-1.94" >> $LFSLOG_PROCESS

time { bash a.08.92A.Net-SSLeay-1.94.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.92B.IO-Socket-SSL-2.088"
echo "08.92B.IO-Socket-SSL-2.088" >> $LFSLOG_PROCESS

time { bash a.08.92B.IO-Socket-SSL-2.088.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.92Z.ntp-4.2.8p18"
echo "08.92Z.ntp-4.2.8p18" >> $LFSLOG_PROCESS

time { bash a.08.92Z.ntp-4.2.8p18.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
