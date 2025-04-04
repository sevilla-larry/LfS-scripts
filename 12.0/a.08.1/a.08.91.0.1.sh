# a.08.91.0.1.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.91.01.CMake-3.27.2.Pass1"
echo "08.91.01.CMake-3.27.2.Pass1" >> $LFSLOG_PROCESS

time { bash a.08.91.01.CMake-3.27.2.Pass1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.02.GPM-1.20.7"
echo "08.91.02.GPM-1.20.7" >> $LFSLOG_PROCESS

time { bash a.08.91.02.GPM-1.20.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.03.Which-2.21"
echo "08.91.03.Which-2.21" >> $LFSLOG_PROCESS

time { bash a.08.91.03.Which-2.21.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.04.Zip-3.0"
echo "08.91.04.Zip-3.0" >> $LFSLOG_PROCESS

time { bash a.08.91.04.Zip-3.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.05.Patchelf-0.17.2"
echo "08.91.05.Patchelf-0.17.2" >> $LFSLOG_PROCESS

time { a.08.91.05.Patchelf-0.17.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.06.Net-tools-2.10"
echo "08.91.06.Net-tools-2.10" >> $LFSLOG_PROCESS

time { bash a.08.91.06.Net-tools-2.10.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.07.icu-73.2"
echo "08.91.07.icu-73.2" >> $LFSLOG_PROCESS

time { bash a.08.91.07.icu-73.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.08.libxml2-2.10.4"
echo "08.91.08.libxml2-2.10.4" >> $LFSLOG_PROCESS

time { bash a.08.91.08.libxml2-2.10.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.09.LZO-2.10"
echo "08.91.09.LZO-2.10" >> $LFSLOG_PROCESS

time { bash a.08.91.09.LZO-2.10.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.10.Nettle-3.9.1"
echo "08.91.10.Nettle-3.9.1" >> $LFSLOG_PROCESS

time { bash a.08.91.10.Nettle-3.9.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.11.PCRE2-10.42"
echo "08.91.11.PCRE2-10.42" >> $LFSLOG_PROCESS

time { bash a.08.91.11.PCRE2-10.42.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.12.libarchive-3.7.1"
echo "08.91.12.libarchive-3.7.1" >> $LFSLOG_PROCESS

time { bash a.08.91.12.libarchive-3.7.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.13.libuv-1.46.0"
echo "08.91.13.libuv-1.46.0" >> $LFSLOG_PROCESS

time { bash a.08.91.13.libuv-1.46.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.14.libevent-2.1.12"
echo "08.91.14.libevent-2.1.12" >> $LFSLOG_PROCESS

time { bash a.08.91.14.libevent-2.1.12.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.15.libtirpc-1.3.3"
echo "08.91.15.libtirpc-1.3.3" >> $LFSLOG_PROCESS

time { bash a.08.91.15.libtirpc-1.3.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.16.libnsl-2.0.0"
echo "08.91.16.libnsl-2.0.0" >> $LFSLOG_PROCESS

time { bash a.08.91.16.libnsl-2.0.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.17.SQLite-3.42.0"
echo "08.91.17.SQLite-3.42.0" >> $LFSLOG_PROCESS

time { bash a.08.91.17.SQLite-3.42.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.18.Python-2.7.18"
echo "08.91.18.Python-2.7.18" >> $LFSLOG_PROCESS

time { bash a.08.91.18.Python-7.7.18.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

# Possible conflict with elogind
#
# echo "08.92I.acpid-2.0.34"
# echo "08.92I.acpid-2.0.34" >> $LFSLOG_PROCESS

# time { bash a.08.92I.acpid-2.0.34.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

# echo "." >> $LFSLOG_PROCESS
# echo "."
# echo "."

#####

unset LFSLOG_PROCESS
