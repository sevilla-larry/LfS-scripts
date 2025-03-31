# a.08.00.Part5.91-91Z.sh
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.91.WGet"
echo "08.91.WGet" >> $LFSLOG_PROCESS

bash a.08.91.WGet.sh ;

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91A.NSPR-4.36"
echo "08.91A.NSPR-4.36" >> $LFSLOG_PROCESS

time { bash a.08.91A.NSPR-4.36.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91B.SQLite-3.49.1"
echo "08.91B.SQLite-3.49.1" >> $LFSLOG_PROCESS

time { bash a.08.91B.SQLite-3.49.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91C.NSS-3.108"
echo "08.91C.NSS-3.108" >> $LFSLOG_PROCESS

time { bash a.08.91C.NSS-3.108.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91D.libtasn1-4.20.0"
echo "08.91D.libtasn1-4.20.0" >> $LFSLOG_PROCESS

time { bash a.08.91D.libtasn1-4.20.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91E.p11-kit-0.25.5"
echo "08.91E.p11-kit-0.25.5" >> $LFSLOG_PROCESS

time { bash a.08.91E.p11-kit-0.25.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91F.make-ca-1.15"
echo "08.91F.make-ca-1.15" >> $LFSLOG_PROCESS

time { bash a.08.91F.make-ca-1.15.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91G.libunistring-1.3"
echo "08.91G.libunistring-1.3" >> $LFSLOG_PROCESS

time { bash a.08.91G.libunistring-1.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91H.libidn2-2.3.7"
echo "08.91H.libidn2-2.3.7" >> $LFSLOG_PROCESS

time { bash a.08.91H.libidn2-2.3.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91I.libpsl-0.21.5"
echo "08.91I.libpsl-0.21.5" >> $LFSLOG_PROCESS

time { bash a.08.91I.libpsl-0.21.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91Z.WGet-1.25.0"
echo "08.91Z.WGet-1.25.0" >> $LFSLOG_PROCESS

time { bash a.08.91Z.WGet-1.25.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
