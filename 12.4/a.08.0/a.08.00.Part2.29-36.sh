# a.08.00.Part2.29-36.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.29.GCC-15.2.0"
echo "08.29.GCC-15.2.0" >> $LFSLOG_PROCESS

time { bash a.08.29.GCC-15.2.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.30.Ncurses-6.5-20250809"
echo "08.30.Ncurses-6.5-20250809" >> $LFSLOG_PROCESS

time { bash a.08.30.Ncurses-6.5-20250809.sh ; }

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

echo "08.33.Gettext-0.26"
echo "08.33.Gettext-0.26" >> $LFSLOG_PROCESS

time { bash a.08.33.Gettext-0.26.sh ; }

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

echo "08.35.Grep-3.12"
echo "08.35.Grep-3.12" >> $LFSLOG_PROCESS

time { bash a.08.35.Grep-3.12.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.36.Bash-5.3"
echo "08.36.Bash-5.3" >> $LFSLOG_PROCESS

time { bash a.08.36.Bash-5.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.36.Bash-5.3.note"
echo "08.36.Bash-5.3.note" >> $LFSLOG_PROCESS

bash a.08.36.Bash-5.3.note.sh

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
