# a.08.00.Part8.94-94C.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.94.Linux-PAM"
echo "08.94.Linux-PAM" >> $LFSLOG_PROCESS

bash a.08.94.Linux-PAM.sh ;

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.94A.libtirpc-1.3.6"
echo "08.94A.libtirpc-1.3.6" >> $LFSLOG_PROCESS

time { bash a.08.94A.libtirpc-1.3.6.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.94B.Linux-PAM-1.7.0"
echo "08.94B.Linux-PAM-1.7.0" >> $LFSLOG_PROCESS

time { bash a.08.94B.Linux-PAM-1.7.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "a.08.94C.Shadow-4.17.3"
echo "a.08.94C.Shadow-4.17.3" >> $LFSLOG_PROCESS

time { bash a.08.94C.Shadow-4.17.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
