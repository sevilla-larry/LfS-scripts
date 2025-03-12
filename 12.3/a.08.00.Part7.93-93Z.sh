# a.08.00.Part7.93-93Z.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.93.NTP"
echo "08.93.NTP" >> $LFSLOG_PROCESS

bash a.08.93.NTP.sh ;

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.93A.Net-SSLeay-1.94"
echo "08.93A.Net-SSLeay-1.94" >> $LFSLOG_PROCESS

time { bash a.08.93A.Net-SSLeay-1.94.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.93B.IO-Socket-SSL-2.089"
echo "08.93B.IO-Socket-SSL-2.089" >> $LFSLOG_PROCESS

time { bash a.08.93B.IO-Socket-SSL-2.089.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.93Z.ntp-4.2.8p18"
echo "08.93Z.ntp-4.2.8p18" >> $LFSLOG_PROCESS

time { bash a.08.93Z.ntp-4.2.8p18.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
