# a.07.12.Util-linux-2.40.2.sh
#

export PKG="util-linux-2.40.2"
export PKGLOG_DIR=$LFSLOG/07.12
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
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


echo "   The FHS recommends using the /var/lib/hwclock directory..."
echo "   The FHS recommends using the /var/lib/hwclock directory..." >> $LFSLOG_PROCESS
echo "   The FHS recommends using the /var/lib/hwclock directory..." >> $PKGLOG_ERROR
mkdir -pv /var/lib/hwclock  > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --libdir=/usr/lib       \
            --runstatedir=/run      \
            --disable-chfn-chsh     \
            --disable-login         \
            --disable-nologin       \
            --disable-su            \
            --disable-setpriv       \
            --disable-runuser       \
            --disable-pylibmount    \
            --disable-static        \
            --disable-liblastlog2   \
            --without-python        \
            ADJTIME_PATH=/var/lib/hwclock/adjtime       \
            --docdir=/usr/share/doc/util-linux-2.40.2   \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
