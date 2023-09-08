# a.08.00.Part6.92-9E.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.92.misc"
echo "08.92.misc" >> $LFSLOG_PROCESS

bash a.08.92.misc.sh ;

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.92A.Lynx-2.8.9rel.1"
echo "08.92A.Lynx-2.8.9rel.1" >> $LFSLOG_PROCESS

time { bash a.08.92A.Lynx-2.8.9rel.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.92B.GPM-1.20.7"
echo "08.92B.GPM-1.20.7" >> $LFSLOG_PROCESS

time { bash a.08.92B.GPM-1.20.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.92C.OpenSSH-9.4p1"
echo "08.92C.OpenSSH-9.4p1" >> $LFSLOG_PROCESS

time { bash a.08.92C.OpenSSH-9.4p1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

# Possible conflict with elogind
#
# echo "08.92D.acpid-2.0.34"
# echo "08.92D.acpid-2.0.34" >> $LFSLOG_PROCESS

# time { bash a.08.92D.acpid-2.0.34.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

# echo "." >> $LFSLOG_PROCESS
# echo "."
# echo "."

###

echo "08.92E.Sudo-1.9.14p3"
echo "08.92E.Sudo-1.9.14p3" >> $LFSLOG_PROCESS

time { bash a.08.92E.Sudo-1.9.14p3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
