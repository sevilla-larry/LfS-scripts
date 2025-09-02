# a.08.91.0.7.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.91.61.libunistring-1.3"
echo "08.91.61.libunistring-1.3" >> $LFSLOG_PROCESS

time { bash a.08.91.61.libunistring-1.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.62.libidn2-2.3.7"
echo "08.91.62.libidn2-2.3.7" >> $LFSLOG_PROCESS

time { bash a.08.91.62.libidn2-2.3.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.63.GnuTLS-3.8.10"
echo "08.91.63.GnuTLS-3.8.10" >> $LFSLOG_PROCESS

time { bash a.08.91.63.GnuTLS-3.8.10.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.64.libpsl-0.21.5"
echo "08.91.64.libpsl-0.21.5" >> $LFSLOG_PROCESS

time { bash a.08.91.64.libpsl-0.21.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.65.c-ares-1.34.5"
echo "08.91.65.c-ares-1.34.5" >> $LFSLOG_PROCESS

time { bash a.08.91.65.c-ares-1.34.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.66.Jansson-2.14"
echo "08.91.66.Jansson-2.14" >> $LFSLOG_PROCESS

time { bash a.08.91.66.Jansson-2.14.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.67.nghttp2-1.64.0"
echo "08.91.67.nghttp2-1.64.0" >> $LFSLOG_PROCESS

time { bash a.08.91.67.nghttp2-1.64.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.68.libssh2-1.11.1"
echo "08.91.68.libssh2-1.11.1" >> $LFSLOG_PROCESS

time { bash a.08.91.68.libssh2-1.11.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
