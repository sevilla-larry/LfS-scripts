# a.08.91.0.8.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.91.71.pciutils-3.14.0"
echo "08.91.71.pciutils-3.14.0" >> $LFSLOG_PROCESS

time { bash a.08.91.71.pciutils-3.14.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.72.hwdata-0.398"
echo "08.91.72.hwdata-0.398" >> $LFSLOG_PROCESS

time { bash a.08.91.72.hwdata-0.398.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.90.sshpass-1.10"
echo "08.91.90.sshpass-1.10" >> $LFSLOG_PROCESS

time { bash a.08.91.90.sshpass-1.10.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
