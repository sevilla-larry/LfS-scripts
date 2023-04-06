# a.7.00.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

#####

echo "7.07.Gettext-0.21.1"
echo "7.07.Gettext-0.21.1" >> $LFSLOG_PROCESS

time { bash a.7.07.Gettext-0.21.1.sh ; }

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "7.08.Bison-3.8.2"
echo "7.08.Bison-3.8.2" >> $LFSLOG_PROCESS

time { bash a.7.08.Bison-3.8.2.sh ; }

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "7.09.Perl-5.36.0"
echo "7.09.Perl-5.36.0" >> $LFSLOG_PROCESS

time { bash a.7.09.Perl-5.36.0.sh ; }

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "7.10.Python-3.11.2"
echo "7.10.Python-3.11.2" >> $LFSLOG_PROCESS

time { bash a.7.10.Python-3.11.2.sh ; }

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "7.11.Texinfo-7.0.2"
echo "7.11.Texinfo-7.0.2" >> $LFSLOG_PROCESS

time { bash a.7.11.Texinfo-7.0.2.sh ; }

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "7.12.Util-linux-2.38.1"
echo "7.12.Util-linux-2.38.1" >> $LFSLOG_PROCESS

time { bash a.7.12.Util-linux-2.38.1.sh ; }

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "7.13.Cleaning.up.Only"
echo "7.13.Cleaning.up.Only" >> $LFSLOG_PROCESS

time { bash a.7.13.Cleaning.up.Only.sh ; }

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "7.13.pause.Backup"
echo "7.13.pause.Backup" >> $LFSLOG_PROCESS

bash a.7.13.pause.Backup.sh

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS