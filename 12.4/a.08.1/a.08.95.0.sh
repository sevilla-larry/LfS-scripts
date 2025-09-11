# a.08.95.0.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.95.1.libnl-3.11.0"
echo "08.95.1.libnl-3.11.0" >> $LFSLOG_PROCESS

time { bash a.08.95.1.libnl-3.11.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.95.2.btop-1.4.4"
echo "08.95.2.btop-1.4.4" >> $LFSLOG_PROCESS

time { bash a.08.95.2.btop-1.4.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
