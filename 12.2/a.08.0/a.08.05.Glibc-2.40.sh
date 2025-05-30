# a.08.05.Glibc-2.40.sh
#

export PKG="glibc-2.40"
export PKGLOG_DIR=$LFSLOG/08.05
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

#Modify the next line for your local time zone
export LOCAL_TIME_ZONE=Asia/Manila

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. Patching..."
echo "2. Patching..." >> $LFSLOG_PROCESS
echo "2. Patching..." >> $PKGLOG_ERROR
patch -Np1 -i ../glibc-2.40-fhs-1.patch \
     > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mkdir build
cd    build

echo "   Ensure that the ldconfig and sln utilities will be installed into /usr/sbin..."
echo "   Ensure that the ldconfig and sln utilities will be installed into /usr/sbin..." >> $LFSLOG_PROCESS
echo "   Ensure that the ldconfig and sln utilities will be installed into /usr/sbin..." >> $PKGLOG_ERROR
echo "rootsbindir=/usr/sbin" > configparms

echo "3. Configure ..."
echo "3. Configure ..." >> $LFSLOG_PROCESS
echo "3. Configure ..." >> $PKGLOG_ERROR
../configure --prefix=/usr                      \
             --disable-werror                   \
             --enable-kernel=4.19               \
             --enable-stack-protector=strong    \
             --disable-nscd                     \
             libc_cv_slibdir=/usr/lib           \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "4. Make Build ..."
echo "4. Make Build ..." >> $LFSLOG_PROCESS
echo "4. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "5. Make Check ..."
echo "5. Make Check ..." >> $LFSLOG_PROCESS
echo "5. Make Check ..." >> $PKGLOG_ERROR
make check > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "   Though it is a harmless message,"
echo "   Though it is a harmless message," >> $LFSLOG_PROCESS
echo "   Though it is a harmless message," >> $PKGLOG_ERROR
echo "   the install stage of Glibc will complain about the absence of /etc/ld.so.conf"
echo "   the install stage of Glibc will complain about the absence of /etc/ld.so.conf" >> $LFSLOG_PROCESS
echo "   the install stage of Glibc will complain about the absence of /etc/ld.so.conf" >> $PKGLOG_ERROR
echo "   Prevent this warning with..."
echo "   Prevent this warning with..." >> $LFSLOG_PROCESS
echo "   Prevent this warning with..." >> $PKGLOG_ERROR
touch /etc/ld.so.conf   >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "   Fix the Makefile to skip an outdated sanity check"
echo "   Fix the Makefile to skip an outdated sanity check" >> $LFSLOG_PROCESS
echo "   Fix the Makefile to skip an outdated sanity check" >> $PKGLOG_ERROR
echo "   that fails with a modern Glibc configuration..."
echo "   that fails with a modern Glibc configuration..." >> $LFSLOG_PROCESS
echo "   that fails with a modern Glibc configuration..." >> $PKGLOG_ERROR
sed '/test-installation/s@$(PERL)@echo not running@' -i ../Makefile \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "6. Make Install ..."
echo "6. Make Install ..." >> $LFSLOG_PROCESS
echo "6. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "   Fix a hardcoded path to the executable loader in the ldd script..."
echo "   Fix a hardcoded path to the executable loader in the ldd script..." >> $LFSLOG_PROCESS
echo "   Fix a hardcoded path to the executable loader in the ldd script..." >> $PKGLOG_ERROR
sed '/RTLDLIST=/s@/usr@@g' -i /usr/bin/ldd  >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "7. Locale Definitions ..."
echo "7. Locale Definitions ..." >> $LFSLOG_PROCESS
echo "7. Locale Definitions ..." >> $PKGLOG_ERROR

localedef -i C -f UTF-8 C.UTF-8
localedef -i cs_CZ -f UTF-8 cs_CZ.UTF-8
localedef -i de_DE -f ISO-8859-1 de_DE
localedef -i de_DE@euro -f ISO-8859-15 de_DE@euro
localedef -i de_DE -f UTF-8 de_DE.UTF-8
localedef -i el_GR -f ISO-8859-7 el_GR
localedef -i en_GB -f ISO-8859-1 en_GB
localedef -i en_GB -f UTF-8 en_GB.UTF-8
localedef -i en_HK -f ISO-8859-1 en_HK
localedef -i en_PH -f ISO-8859-1 en_PH
localedef -i en_US -f ISO-8859-1 en_US
localedef -i en_US -f UTF-8 en_US.UTF-8
localedef -i es_ES -f ISO-8859-15 es_ES@euro
localedef -i es_MX -f ISO-8859-1 es_MX
localedef -i fa_IR -f UTF-8 fa_IR
localedef -i fr_FR -f ISO-8859-1 fr_FR
localedef -i fr_FR@euro -f ISO-8859-15 fr_FR@euro
localedef -i fr_FR -f UTF-8 fr_FR.UTF-8
localedef -i is_IS -f ISO-8859-1 is_IS
localedef -i is_IS -f UTF-8 is_IS.UTF-8
localedef -i it_IT -f ISO-8859-1 it_IT
localedef -i it_IT -f ISO-8859-15 it_IT@euro
localedef -i it_IT -f UTF-8 it_IT.UTF-8
localedef -i ja_JP -f EUC-JP ja_JP
localedef -i ja_JP -f SHIFT_JIS ja_JP.SJIS 2> /dev/null || true
localedef -i ja_JP -f UTF-8 ja_JP.UTF-8
localedef -i nl_NL@euro -f ISO-8859-15 nl_NL@euro
localedef -i ru_RU -f KOI8-R ru_RU.KOI8-R
localedef -i ru_RU -f UTF-8 ru_RU.UTF-8
localedef -i se_NO -f UTF-8 se_NO.UTF-8
localedef -i ta_IN -f UTF-8 ta_IN.UTF-8
localedef -i tr_TR -f UTF-8 tr_TR.UTF-8
localedef -i zh_CN -f GB18030 zh_CN.GB18030
localedef -i zh_HK -f BIG5-HKSCS zh_HK.BIG5-HKSCS
localedef -i zh_TW -f UTF-8 zh_TW.UTF-8

echo "8. Adding nsswitch.conf ..."
echo "8. Adding nsswitch.conf ..." >> $LFSLOG_PROCESS
echo "8. Adding nsswitch.conf ..." >> $PKGLOG_ERROR

cat > /etc/nsswitch.conf << "EOF" 2>> $PKGLOG_ERROR
# Begin /etc/nsswitch.conf

passwd: files
group: files
shadow: files

hosts: files dns
networks: files

protocols: files
services: files
ethers: files
rpc: files

# End /etc/nsswitch.conf
EOF

echo "9. Setting Time Zone ..."
echo "9. Setting Time Zone ..." >> $LFSLOG_PROCESS
echo "9. Setting Time Zone ..." >> $PKGLOG_ERROR
tar -xvf ../../tzdata2024a.tar.gz    \
    >> $PKGLOG_TAR 2>> $PKGLOG_ERROR

ZONEINFO=/usr/share/zoneinfo
mkdir -p $ZONEINFO/{posix,right}

for tz in etcetera southamerica northamerica europe africa antarctica   \
          asia australasia backward; do
    zic -L /dev/null   -d $ZONEINFO       ${tz}
    zic -L /dev/null   -d $ZONEINFO/posix ${tz}
    zic -L leapseconds -d $ZONEINFO/right ${tz}
done

cp zone.tab zone1970.tab iso3166.tab $ZONEINFO
zic -d $ZONEINFO -p $LOCAL_TIME_ZONE
unset ZONEINFO

ln -sf /usr/share/zoneinfo/$LOCAL_TIME_ZONE /etc/localtime

echo "10. Configuring the Dynamic Loader ..."
echo "10. Configuring the Dynamic Loader ..." >> $LFSLOG_PROCESS
echo "10. Configuring the Dynamic Loader ..." >> $PKGLOG_ERROR

cat > /etc/ld.so.conf << "EOF"  2>> $PKGLOG_ERROR
# Begin /etc/ld.so.conf
/usr/local/lib
/opt/lib

EOF

cat >> /etc/ld.so.conf << "EOF" 2>> $PKGLOG_ERROR
# Add an include directory
include /etc/ld.so.conf.d/*.conf

EOF

mkdir -p /etc/ld.so.conf.d


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LOCAL_TIME_ZONE
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
