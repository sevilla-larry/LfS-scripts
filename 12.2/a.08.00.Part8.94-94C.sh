# a.08.00.Part8.94-94C.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.94A.libtirpc-1.3.5"
echo "08.94A.libtirpc-1.3.5" >> $LFSLOG_PROCESS

time { bash a.08.94A.libtirpc-1.3.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.94B.Linux-PAM-1.6.1"
echo "08.94B.Linux-PAM-1.6.1" >> $LFSLOG_PROCESS

time { bash a.08.94B.Linux-PAM-1.6.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "a.08.94C.Shadow-4.16.0"
echo "a.08.94C.Shadow-4.16.0" >> $LFSLOG_PROCESS

time { bash a.08.94C.Shadow-4.16.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
