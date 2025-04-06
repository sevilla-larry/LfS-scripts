# a.08.28.Shadow-4.16.0.Part1.sh
#

export PKG="shadow-4.16.0"
export PKGLOG_DIR=$LFSLOG/08.28
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "   Disable the installation of the groups program and its man pages, as Coreutils provides a better version."
echo "   Disable the installation of the groups program and its man pages, as Coreutils provides a better version." >> $LFSLOG_PROCESS
echo "   Disable the installation of the groups program and its man pages, as Coreutils provides a better version." >> $PKGLOG_ERROR
echo "   Also, prevent the installation of manual pages that were already installed..."
echo "   Also, prevent the installation of manual pages that were already installed..." >> $LFSLOG_PROCESS
echo "   Also, prevent the installation of manual pages that were already installed..." >> $PKGLOG_ERROR
sed -i 's/groups$(EXEEXT) //' src/Makefile.in                       >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
find man -name Makefile.in -exec sed -i 's/groups\.1 / /'   {}      >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {}      >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
find man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {}      >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "   Instead of using the default crypt method, use the much more secure YESCRYPT method of password encryption."
echo "   Instead of using the default crypt method, use the much more secure YESCRYPT method of password encryption." >> $LFSLOG_PROCESS
echo "   Instead of using the default crypt method, use the much more secure YESCRYPT method of password encryption." >> $PKGLOG_ERROR
echo "   Change the obsolete /var/spool/mail location for user mailboxes that Shadow uses by default to the /var/mail location."
echo "   Change the obsolete /var/spool/mail location for user mailboxes that Shadow uses by default to the /var/mail location." >> $LFSLOG_PROCESS
echo "   Change the obsolete /var/spool/mail location for user mailboxes that Shadow uses by default to the /var/mail location." >> $PKGLOG_ERROR
echo "   Remove /bin and /sbin from the PATH..."
echo "   Remove /bin and /sbin from the PATH..." >> $LFSLOG_PROCESS
echo "   Remove /bin and /sbin from the PATH..." >> $PKGLOG_ERROR
sed -e 's:#ENCRYPT_METHOD DES:ENCRYPT_METHOD YESCRYPT:' \
    -e 's:/var/spool/mail:/var/mail:'                   \
    -e '/PATH=/{s@/sbin:@@;s@/bin:@@}'                  \
    -i etc/login.defs                                   \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
touch /usr/bin/passwd
./configure --sysconfdir=/etc   \
            --disable-static    \
            --with-{b,yes}crypt \
            --without-libbsd    \
            --with-group-name-max-length=32 \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make exec_prefix=/usr install   \
     > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
make -C man install-man         \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
#unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
