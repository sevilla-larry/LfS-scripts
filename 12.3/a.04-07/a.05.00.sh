# a.05.00.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "05.02.Binutils-2.44-Pass1"
echo "05.02.Binutils-2.44-Pass1" >> $LFSLOG_PROCESS

time { bash a.05.02.Binutils-2.44-Pass1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "05.03.GCC-14.2.0-Pass1"
echo "05.03.GCC-14.2.0-Pass1" >> $LFSLOG_PROCESS

time { bash a.05.03.GCC-14.2.0-Pass1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "05.04.Linux-6.13.4.API.Headers"
echo "05.04.Linux-6.13.4.API.Headers" >> $LFSLOG_PROCESS

time { bash a.05.04.Linux-6.13.4.API.Headers.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

if		[ "$GLIBC" = "2.41" ]; then

	echo "05.05.Glibc-2.41"
	echo "05.05.Glibc-2.41" >> $LFSLOG_PROCESS

	time { bash a.05.05.Glibc-2.41.sh ; }

elif	[ "$GLIBC" = "2.42" ]; then

	echo "05.05.Glibc-2.42"
	echo "05.05.Glibc-2.42" >> $LFSLOG_PROCESS

	time { bash a.05.05.Glibc-2.42.sh ; }

fi

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "05.06.Libstdc++.from.GCC-14.2.0"
echo "05.06.Libstdc++.from.GCC-14.2.0" >> $LFSLOG_PROCESS

time { bash a.05.06.Libstdc++.from.GCC-14.2.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
