# a.08.92.0.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.92.01.Linux-PAM-1.7.1"
echo "08.92.01.Linux-PAM-1.7.1" >> $LFSLOG_PROCESS

time { bash a.08.92.01.Linux-PAM-1.7.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.92.02.Shadow-4.17.3"
echo "08.92.02.Shadow-4.17.3" >> $LFSLOG_PROCESS

time { bash a.08.92.02.Shadow-4.17.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.92.03.Libcap-2.73.with.PAM"
echo "08.92.03.Libcap-2.73.with.PAM" >> $LFSLOG_PROCESS

time { bash a.08.92.03.Libcap-2.73.with.PAM.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.92.11.Sudo-1.9.17p1"
echo "08.92.11.Sudo-1.9.17p1" >> $LFSLOG_PROCESS

time { bash a.08.92.11.Sudo-1.9.17p1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.92.12.OpenSSH-9.9p2"
echo "08.92.12.OpenSSH-9.9p2" >> $LFSLOG_PROCESS

time { bash a.08.92.12.OpenSSH-9.9p2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
