# a.08.00.Part2.29-36.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.29.GCC-14.2.0"
echo "08.29.GCC-14.2.0" >> $LFSLOG_PROCESS

time { bash a.08.29.GCC-14.2.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.30.Ncurses-6.5"
echo "08.30.Ncurses-6.5" >> $LFSLOG_PROCESS

time { bash a.08.30.Ncurses-6.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.31.Sed-4.9"
echo "08.31.Sed-4.9" >> $LFSLOG_PROCESS

time { bash a.08.31.Sed-4.9.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.32.Psmisc-23.7"
echo "08.32.Psmisc-23.7" >> $LFSLOG_PROCESS

time { bash a.08.32.Psmisc-23.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.33.Gettext-0.22.5"
echo "08.33.Gettext-0.22.5" >> $LFSLOG_PROCESS

time { bash a.08.33.Gettext-0.22.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.34.Bison-3.8.2"
echo "08.34.Bison-3.8.2" >> $LFSLOG_PROCESS

time { bash a.08.34.Bison-3.8.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.35.Grep-3.11"
echo "08.35.Grep-3.11" >> $LFSLOG_PROCESS

time { bash a.08.35.Grep-3.11.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.36.Bash-5.2.32.Part1"
echo "08.36.Bash-5.2.32.Part1" >> $LFSLOG_PROCESS

time { bash a.08.36.Bash-5.2.32.Part1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.36.Bash-5.2.32.Part9"
echo "08.36.Bash-5.2.32.Part9" >> $LFSLOG_PROCESS

bash a.08.36.Bash-5.2.32.Part9.sh

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
