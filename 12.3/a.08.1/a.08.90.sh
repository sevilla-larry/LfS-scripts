# a.08.00.Part4.90-90Z.sh
#
# Replacement for a.08.64.GRUB
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.90.GRUB.for.EFI.x64"
echo "08.90.GRUB.for.EFI.x64" >> $LFSLOG_PROCESS

bash a.08.90.GRUB.for.EFI.x64.sh ;

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.90A.Popt-1.19"
echo "08.90A.Popt-1.19" >> $LFSLOG_PROCESS

time { bash a.08.90A.Popt-1.19.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

# echo "08.90B.mandoc-1.14.6"
# echo "08.90B.mandoc-1.14.6" >> $LFSLOG_PROCESS

# time { bash a.08.90B.mandoc-1.14.6.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

# echo "." >> $LFSLOG_PROCESS
# echo "."
# echo "."

###

echo "08.90C.efivar-39"
echo "08.90C.efivar-39" >> $LFSLOG_PROCESS

time { bash a.08.90C.efivar-39.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.90D.efibootmgr-18"
echo "08.90D.efibootmgr-18" >> $LFSLOG_PROCESS

time { bash a.08.90D.efibootmgr-18.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.90Z.GRUB-2.12.for.EFI.x64"
echo "08.90Z.GRUB-2.12.for.EFI.x64" >> $LFSLOG_PROCESS

time { bash a.08.90Z.GRUB-2.12.for.EFI.x64.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
