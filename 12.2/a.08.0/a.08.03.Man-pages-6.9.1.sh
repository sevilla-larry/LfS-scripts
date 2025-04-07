# a.08.03.Man-pages-6.9.1.sh
#

export PKG="man-pages-6.9.1"
export PKGLOG_DIR=$LFSLOG/08.03
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
#export PKGLOG_BUILD=$PKGLOG_DIR/build.log
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


echo "   Remove two man pages for password hashing functions."
echo "   Remove two man pages for password hashing functions." >> $LFSLOG_PROCESS
echo "   Remove two man pages for password hashing functions." >> $PKGLOG_ERROR
echo "   Libxcrypt will provide a better version of these man pages..."
echo "   Libxcrypt will provide a better version of these man pages..." >> $LFSLOG_PROCESS
echo "   Libxcrypt will provide a better version of these man pages..." >> $PKGLOG_ERROR
rm -v man3/crypt*   >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Make Install ..."
echo "2. Make Install ..." >> $LFSLOG_PROCESS
echo "2. Make Install ..." >> $PKGLOG_ERROR
make prefix=/usr install    \
    > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL
# PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
