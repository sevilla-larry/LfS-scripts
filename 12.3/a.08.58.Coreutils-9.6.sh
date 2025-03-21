# a.08.58.Coreutils-9.6.sh
#

export PKG="coreutils-9.6"
export PKGLOG_DIR=$LFSLOG/08.58
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
patch -Np1 -i ../coreutils-9.6-i18n-1.patch \
     > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "3. Configure ..."
echo "3. Configure ..." >> $LFSLOG_PROCESS
echo "3. Configure ..." >> $PKGLOG_ERROR
autoreconf -fv  > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
automake -afv  >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
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

echo "   Add a temporary group and make the user tester a part of it..."
echo "   Add a temporary group and make the user tester a part of it..." >> $LFSLOG_PROCESS
echo "   Add a temporary group and make the user tester a part of it..." >> $PKGLOG_ERROR
groupadd -g 102 dummy -U tester    \
     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "   Fix some of the permissions so that the non-root user can compile and run the tests..."
echo "   Fix some of the permissions so that the non-root user can compile and run the tests..." >> $LFSLOG_PROCESS
echo "   Fix some of the permissions so that the non-root user can compile and run the tests..." >> $PKGLOG_ERROR
chown -vR tester .   \
     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "   Run the tests..."
echo "   Run the tests..." >> $LFSLOG_PROCESS
echo "   Run the tests..." >> $PKGLOG_ERROR
su tester -c "PATH=$PATH make -k RUN_EXPENSIVE_TESTS=yes check"    \
    < /dev/null >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "   Remove the temporary group..."
echo "   Remove the temporary group..." >> $LFSLOG_PROCESS
echo "   Remove the temporary group..." >> $PKGLOG_ERROR
groupdel dummy   \
     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "6. Make Install ..."
echo "6. Make Install ..." >> $LFSLOG_PROCESS
echo "6. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "   Move programs to the locations specified by the FHS..."
echo "   Move programs to the locations specified by the FHS..." >> $LFSLOG_PROCESS
echo "   Move programs to the locations specified by the FHS..." >> $PKGLOG_ERROR
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
