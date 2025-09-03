# a.08.91.0.4.sh
#
# libraries with Python dependencies
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.91.21.libseccomp-2.6.0"
echo "08.91.21.libseccomp-2.6.0" >> $LFSLOG_PROCESS

time { bash a.08.91.21.libseccomp-2.6.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.22.brotli-1.1.0"
echo "08.91.22.brotli-1.1.0" >> $LFSLOG_PROCESS

time { bash a.08.91.22.brotli-1.1.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.23.boost-1.89.0"
echo "08.91.23.boost-1.89.0" >> $LFSLOG_PROCESS

time { bash a.08.91.23.boost-1.89.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
