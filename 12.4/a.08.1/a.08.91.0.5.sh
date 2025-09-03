# a.08.91.0.5.sh
#
# net apps
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.91.31.NSPR-4.37"
echo "08.91.31.NSPR-4.37" >> $LFSLOG_PROCESS

time { bash a.08.91.31.NSPR-4.37.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.32.NSS-3.115"
echo "08.91.32.NSS-3.115" >> $LFSLOG_PROCESS

time { bash a.08.91.32.NSS-3.115.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.33.libtasn1-4.20.0"
echo "08.91.33.libtasn1-4.20.0" >> $LFSLOG_PROCESS

time { bash a.08.91.33.libtasn1-4.20.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.34.libgpg-error-1.55"
echo "08.91.34.libgpg-error-1.55" >> $LFSLOG_PROCESS

time { bash a.08.91.34.libgpg-error-1.55.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.35.libgcrypt-1.11.2"
echo "08.91.35.libgcrypt-1.11.2" >> $LFSLOG_PROCESS

time { bash a.08.91.35.libgcrypt-1.11.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.36.docbook-xml-4.5"
echo "08.91.36.docbook-xml-4.5" >> $LFSLOG_PROCESS

time { bash a.08.91.36.docbook-xml-4.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.37.docbook-xsl-nons-1.79.2"
echo "08.91.37.docbook-xsl-nons-1.79.2" >> $LFSLOG_PROCESS

time { bash a.08.91.37.docbook-xsl-nons-1.79.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.38.libxslt-1.1.43"
echo "08.91.38.libxslt-1.1.43" >> $LFSLOG_PROCESS

time { bash a.08.91.38.libxslt-1.1.43.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.39.p11-kit-0.25.5"
echo "08.91.39.p11-kit-0.25.5" >> $LFSLOG_PROCESS

time { bash a.08.91.39.p11-kit-0.25.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.91.40.make-ca-1.16.1"
echo "08.91.40.make-ca-1.16.1" >> $LFSLOG_PROCESS

time { bash a.08.91.40.make-ca-1.16.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
