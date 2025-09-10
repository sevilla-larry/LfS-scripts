# a.08.90.sh
#
# Replacement for a.08.64.GRUB
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.90.1.Popt-1.19"
echo "08.90.1.Popt-1.19" >> $LFSLOG_PROCESS

time { bash a.08.90.1.Popt-1.19.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.90.2.efivar-39"
echo "08.90.2.efivar-39" >> $LFSLOG_PROCESS

time { bash a.08.90.2.efivar-39.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.90.3.efibootmgr-18"
echo "08.90.3.efibootmgr-18" >> $LFSLOG_PROCESS

time { bash a.08.90.3.efibootmgr-18.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

export ZCCF=$CFLAGS
export ZLDF=$LDFLAGS

unset {C,CPP,CXX,LD}FLAGS

echo "08.90.4.GRUB-2.12.for.EFI.x64"
echo "08.90.4.GRUB-2.12.for.EFI.x64" >> $LFSLOG_PROCESS

time { bash a.08.90.4.GRUB-2.12.for.EFI.x64.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

export CFLAGS=$ZCCF
export CXXFLAGS=$ZCCF
export CPPFLAGS=$ZCCF
export LDFLAGS=$ZLDF

unset ZCCF ZLDF

#####

unset LFSLOG_PROCESS
