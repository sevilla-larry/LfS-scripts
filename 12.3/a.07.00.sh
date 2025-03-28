# a.07.00.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "07.07.Gettext-0.24"
echo "07.07.Gettext-0.24" >> $LFSLOG_PROCESS

time { bash a.07.07.Gettext-0.24.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "07.08.Bison-3.8.2"
echo "07.08.Bison-3.8.2" >> $LFSLOG_PROCESS

time { bash a.07.08.Bison-3.8.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "07.09.Perl-5.40.1"
echo "07.09.Perl-5.40.1" >> $LFSLOG_PROCESS

time { bash a.07.09.Perl-5.40.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "07.10.Python-3.13.2"
echo "07.10.Python-3.13.2" >> $LFSLOG_PROCESS

time { bash a.07.10.Python-3.13.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "07.11.Texinfo-7.2"
echo "07.11.Texinfo-7.2" >> $LFSLOG_PROCESS

time { bash a.07.11.Texinfo-7.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "07.12.Util-linux-2.40.4"
echo "07.12.Util-linux-2.40.4" >> $LFSLOG_PROCESS

time { bash a.07.12.Util-linux-2.40.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "07.13.Cleaning.up.Only"
echo "07.13.Cleaning.up.Only" >> $LFSLOG_PROCESS

time { bash a.07.13.Cleaning.up.Only.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
