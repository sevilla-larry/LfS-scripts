# a.08.00.Part2.26-34.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.27.GCC-13.2.0"
echo "08.27.GCC-13.2.0" >> $LFSLOG_PROCESS

time { bash a.08.27.GCC-13.2.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.28.Pkg-config-2.0.1"
echo "08.28.Pkg-config-2.0.1" >> $LFSLOG_PROCESS

time { bash a.08.28.Pkg-config-2.0.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###
#	Ncurses-6.4.20230520 (errata)

echo "08.29.Ncurses-6.4.20230520"
echo "08.29.Ncurses-6.4.20230520" >> $LFSLOG_PROCESS

time { bash a.08.29.Ncurses-6.4.20230520.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.30.Sed-4.9"
echo "08.30.Sed-4.9" >> $LFSLOG_PROCESS

time { bash a.08.30.Sed-4.9.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.31.Psmisc-23.6"
echo "08.31.Psmisc-23.6" >> $LFSLOG_PROCESS

time { bash a.08.31.Psmisc-23.6.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.32.Gettext-0.22"
echo "08.32.Gettext-0.22" >> $LFSLOG_PROCESS

time { bash a.08.32.Gettext-0.22.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.33.Bison-3.8.2"
echo "08.33.Bison-3.8.2" >> $LFSLOG_PROCESS

time { bash a.08.33.Bison-3.8.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.34.Grep-3.11"
echo "08.34.Grep-3.11" >> $LFSLOG_PROCESS

time { bash a.08.34.Grep-3.11.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.35.Bash-5.2.15"
echo "08.35.Bash-5.2.15" >> $LFSLOG_PROCESS

time { bash a.08.35.Bash-5.2.15.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.35.Bash-5.2.15.note"
echo "08.35.Bash-5.2.15.note" >> $LFSLOG_PROCESS

bash a.08.35.Bash-5.2.15.note.sh

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
