# a.08.66.IPRoute2-6.16.0.sh
#

export PKG="iproute2-6.16.0"
export PKGLOG_DIR=$LFSLOG/08.66
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "   Prevent a directory and a man page for arpd to be installed..."
echo "   Prevent a directory and a man page for arpd to be installed..." >> $LFSLOG_PROCESS
echo "   Prevent a directory and a man page for arpd to be installed..." >> $PKGLOG_ERROR
sed -i /ARPD/d Makefile	>> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
rm -fv man/man8/arpd.8	>> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Make Build ..."
echo "2. Make Build ..." >> $LFSLOG_PROCESS
echo "2. Make Build ..." >> $PKGLOG_ERROR
make NETNS_RUN_DIR=/run/netns \
        > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "3. Make Install ..."
echo "3. Make Install ..." >> $LFSLOG_PROCESS
echo "3. Make Install ..." >> $PKGLOG_ERROR
make SBINDIR=/usr/sbin install  \
        > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "   Install the documentation..."
echo "   Install the documentation..." >> $LFSLOG_PROCESS
echo "   Install the documentation..." >> $PKGLOG_ERROR
install -vDm644 COPYING README*           \
        -t /usr/share/doc/iproute2-6.16.0 \
	      >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
#unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD
# PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
