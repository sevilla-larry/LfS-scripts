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

echo "08.91A.libtasn1-4.19.0"
echo "08.91A.libtasn1-4.19.0" >> $LFSLOG_PROCESS

time { bash a.08.91A.libtasn1-4.19.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91B.NSPR-4.35"
echo "08.91B.NSPR-4.35" >> $LFSLOG_PROCESS

time { bash a.08.91B.NSPR-4.35.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91C.NSS-3.103"
echo "08.91C.NSS-3.103" >> $LFSLOG_PROCESS

time { bash a.08.91C.NSS-3.103.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91D.p11-kit-0.25.5"
echo "08.91D.p11-kit-0.25.5" >> $LFSLOG_PROCESS

time { bash a.08.91D.p11-kit-0.25.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91E.make-ca-1.14"
echo "08.91E.make-ca-1.14" >> $LFSLOG_PROCESS

time { bash a.08.91E.make-ca-1.14.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91F.libunistring-1.2"
echo "08.91F.libunistring-1.2" >> $LFSLOG_PROCESS

time { bash a.08.91F.libunistring-1.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91G.libidn2-2.3.7"
echo "08.91G.libidn2-2.3.7" >> $LFSLOG_PROCESS

time { bash a.08.91G.libidn2-2.3.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91H.libpsl-0.21.5"
echo "08.91H.libpsl-0.21.5" >> $LFSLOG_PROCESS

time { bash a.08.91H.libpsl-0.21.5.sh ; }

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
