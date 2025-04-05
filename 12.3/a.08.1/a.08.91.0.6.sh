# a.08.91.0.6.sh
#
# Perl Modules and Dependencies
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.91.50.01.Capture-Tiny-0.50"
echo "08.91.50.01.Capture-Tiny-0.50" >> $LFSLOG_PROCESS

time { bash a.08.91.50.01.Capture-Tiny-0.50.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.50.02.Try-Tiny-0.32"
echo "08.91.50.02.Try-Tiny-0.32" >> $LFSLOG_PROCESS

time { bash a.08.91.50.02.Try-Tiny-0.32.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.50.03.Test-Fatal-0.017"
echo "08.91.50.03.Test-Fatal-0.017" >> $LFSLOG_PROCESS

time { bash a.08.91.50.03.Test-Fatal-0.017.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.50.04.Test-Needs-0.002010"
echo "08.91.50.04.Test-Needs-0.002010" >> $LFSLOG_PROCESS

time { bash a.08.91.50.04.Test-Needs-0.002010.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.50.05.Test-Warnings-0.038"
echo "08.91.50.05.Test-Warnings-0.038" >> $LFSLOG_PROCESS

time { bash a.08.91.50.05.Test-Warnings-0.038.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.50.06.MIME-Base32-1.303"
echo "08.91.50.06.MIME-Base32-1.303" >> $LFSLOG_PROCESS

time { bash a.08.91.50.06.MIME-Base32-1.303.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.50.07.URI-5.31"
echo "08.91.50.07.URI-5.31" >> $LFSLOG_PROCESS

time { bash a.08.91.50.07.URI-5.31.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.50.08.Net-SSLeay-1.94"
echo "08.91.50.08.Net-SSLeay-1.94" >> $LFSLOG_PROCESS

time { bash a.08.91.50.08.Net-SSLeay-1.94.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.50.09.IO-Socket-SSL-2.089"
echo "08.91.50.09.IO-Socket-SSL-2.089" >> $LFSLOG_PROCESS

time { bash a.08.91.50.09.IO-Socket-SSL-2.089.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
