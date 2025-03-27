# a.08.79.Util-linux-2.40.4.sh
#

export PKG="util-linux-2.40.4"
export PKGLOG_DIR=$LFSLOG/08.79
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --bindir=/usr/bin       \
            --libdir=/usr/lib       \
            --runstatedir=/run      \
            --sbindir=/usr/sbin     \
            --disable-chfn-chsh     \
            --disable-login         \
            --disable-nologin       \
            --disable-su            \
            --disable-setpriv       \
            --disable-runuser       \
            --disable-pylibmount    \
            --disable-liblastlog2   \
            --disable-static        \
            --without-python        \
            --without-systemd       \
            --without-systemdsystemunitdir             \
            ADJTIME_PATH=/var/lib/hwclock/adjtime      \
            --docdir=/usr/share/doc/util-linux-2.40.4  \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR


# check if HANGing

echo "4. Make Check ..."
echo "4. Make Check ..." >> $LFSLOG_PROCESS
echo "4. Make Check ..." >> $PKGLOG_ERROR
touch /etc/fstab
chown -vR tester .            \
     > $PKGLOG_CHECK 2>> $PKGLOG_ERROR
su tester -c "make -k check TESTOPTS='--timeout 120'"  \
    >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR


echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
