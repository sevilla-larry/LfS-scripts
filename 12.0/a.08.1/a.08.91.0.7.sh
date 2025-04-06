# a.08.91.0.7.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.91.61.libunistring-1.1"
echo "08.91.61.libunistring-1.1" >> $LFSLOG_PROCESS

time { bash a.08.91.61.libunistring-1.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.62.libidn2-2.3.4"
echo "08.91.62.libidn2-2.3.4" >> $LFSLOG_PROCESS

time { bash a.08.91.62.libidn2-2.3.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.63.GnuTLS-3.8.3"
echo "08.91.63.GnuTLS-3.8.3" >> $LFSLOG_PROCESS

time { bash a.08.91.63.GnuTLS-3.8.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.64.libpsl-0.21.2"
echo "08.91.64.libpsl-0.21.2" >> $LFSLOG_PROCESS

time { bash a.08.91.64.libpsl-0.21.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.65.c-ares-1.19.1"
echo "08.91.65.c-ares-1.19.1" >> $LFSLOG_PROCESS

time { bash a.08.91.65.c-ares-1.19.1.sh ; }

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

echo "08.91.67.nghttp2-1.59.0"
echo "08.91.67.nghttp2-1.59.0" >> $LFSLOG_PROCESS

time { bash a.08.91.67.nghttp2-1.59.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.68.libssh2-1.11.0"
echo "08.91.68.libssh2-1.11.0" >> $LFSLOG_PROCESS

time { bash a.08.91.68.libssh2-1.11.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
