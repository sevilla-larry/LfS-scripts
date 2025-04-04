# a.08.56.Coreutils-9.3.sh
# errata

export PKG="coreutils-9.3"
export PKGLOG_DIR=$LFSLOG/08.56
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

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
patch -Np1 -i ../coreutils-9.3-i18n-1.patch         \
     > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "   Errata Fix ..."
echo "   Errata Fix ..." >> $LFSLOG_PROCESS
echo "   Errata Fix ..." >> $PKGLOG_ERROR
sed -e '/n_out += n_hold/,+4 s|.*bufsize.*|//&|'    \
    -i src/split.c                                  \
     > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "3. Configure ..."
echo "3. Configure ..." >> $LFSLOG_PROCESS
echo "3. Configure ..." >> $PKGLOG_ERROR
autoreconf -fiv > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
FORCE_UNSAFE_CONFIGURE=1                     \
     ./configure                             \
     --prefix=/usr                           \
     --enable-no-install-program=kill,uptime \
     >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "4. Make Build ..."
echo "4. Make Build ..." >> $LFSLOG_PROCESS
echo "4. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "5. Test ..."
echo "5. Test ..." >> $LFSLOG_PROCESS
echo "5. Test ..." >> $PKGLOG_ERROR
make NON_ROOT_USERNAME=tester check-root    \
     > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

#echo "dummy:x:102:tester" >> /etc/group 2>> $PKGLOG_ERROR
groupadd -g 102 dummy -U tester    \
     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chown -Rv tester .  \
     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

su tester -c "PATH=$PATH make RUN_EXPENSIVE_TESTS=yes check"    \
    >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

groupdel dummy      \
     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "6. Make Install ..."
echo "6. Make Install ..." >> $LFSLOG_PROCESS
echo "6. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

mv -v /usr/bin/chroot /usr/sbin                   \
     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
mv -v /usr/share/man/man1/chroot.1                \
      /usr/share/man/man8/chroot.8                \
     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
sed -i 's/"1"/"8"/' /usr/share/man/man8/chroot.8  \
     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
