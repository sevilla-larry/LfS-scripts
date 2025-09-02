# a.07.00.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "07.07.Gettext-0.26"
echo "07.07.Gettext-0.26" >> $LFSLOG_PROCESS

time { bash a.07.07.Gettext-0.26.sh ; }

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

echo "07.09.Perl-5.42.0"
echo "07.09.Perl-5.42.0" >> $LFSLOG_PROCESS

time { bash a.07.09.Perl-5.42.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

# if	 [ "$PYVER" -eq 12 ]; then
#
# 	echo "07.10.Python-3.12.11"
# 	echo "07.10.Python-3.12.11" >> $LFSLOG_PROCESS
# 	time { bash a.07.10.Python-3.12.11.sh ; }
#
# elif [ "$PYVER" -eq 13 ]; then
#
# 	echo "07.10.Python-3.13.7"
# 	echo "07.10.Python-3.13.7" >> $LFSLOG_PROCESS
# 	time { bash a.07.10.Python-3.13.7.sh ; }
#
# else
#
# 	echo "Error: PYVER must be 12 or 13"
# 	echo "Error: PYVER must be 12 or 13" >> $LFSLOG_PROCESS
#
# fi

case "$PYVER" in
    12)
		echo "07.10.Python-3.12.11"
		echo "07.10.Python-3.12.11" >> $LFSLOG_PROCESS
		time { bash a.07.10.Python-3.12.11.sh ; }
        ;;
    13)
		echo "07.10.Python-3.13.7"
		echo "07.10.Python-3.13.7" >> $LFSLOG_PROCESS
		time { bash a.07.10.Python-3.13.7.sh ; }
        ;;
    *)
		echo "Error: PYVER must be 12 or 13"
		echo "Error: PYVER must be 12 or 13" >> $LFSLOG_PROCESS
        ;;
esac

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

echo "07.12.Util-linux-2.41.1"
echo "07.12.Util-linux-2.41.1" >> $LFSLOG_PROCESS

time { bash a.07.12.Util-linux-2.41.1.sh ; }

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
