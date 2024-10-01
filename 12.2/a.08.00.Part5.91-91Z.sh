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

echo "08.91B.p11-kit-0.25.5"
echo "08.91B.p11-kit-0.25.5" >> $LFSLOG_PROCESS

time { bash a.08.91B.p11-kit-0.25.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91C.make-ca-1.14"
echo "08.91C.make-ca-1.14" >> $LFSLOG_PROCESS

time { bash a.08.91C.make-ca-1.14.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91Z.WGet-1.24.5"
echo "08.91Z.WGet-1.24.5" >> $LFSLOG_PROCESS

time { bash a.08.91Z.WGet-1.24.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
