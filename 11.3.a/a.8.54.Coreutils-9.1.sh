# a.8.54.Coreutils-9.1.sh
#

export PKG="coreutils-9.1"
export PKGLOG_DIR=$LFSLOG/8.54
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


patch -Np1 -i ../coreutils-9.1-i18n-1.patch

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
autoreconf -fi
FORCE_UNSAFE_CONFIGURE=1 ./configure                \
            --prefix=/usr                           \
            --enable-no-install-program=kill,uptime \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Test ..."
echo "4. Test ..." >> $LFSLOG_PROCESS
echo "4. Test ..." >> $PKGLOG_ERROR
make NON_ROOT_USERNAME=tester check-root    \
     > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "dummy:x:102:tester" >> /etc/group 2>> $PKGLOG_ERROR

chown -R tester .   \
     > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

su tester -c "PATH=$PATH make RUN_EXPENSIVE_TESTS=yes check"    \
    >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

sed -i '/dummy/d' /etc/group

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

mv  /usr/bin/chroot /usr/sbin
mv  /usr/share/man/man1/chroot.1    \
    /usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/' /usr/share/man/man8/chroot.8


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
