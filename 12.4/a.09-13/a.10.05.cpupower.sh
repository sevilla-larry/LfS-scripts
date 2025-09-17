# a.10.05.CPUPower.sh
#
# build CPUPower from Linux Kernel Source
#

#export PKG="cpupower-$LKV"
export PKGLOG_DIR=$LFSLOG/10.05
#export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

cd linux-$LKV/tools/power/cpupower


echo "1. Make Build ..."
echo "1. Make Build ..." >> $LFSLOG_PROCESS
echo "1. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "2. Make Install ..."
echo "2. Make Install ..." >> $LFSLOG_PROCESS
echo "2. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
#rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD
#PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR
#PKGLOG_TAR
unset PKGLOG_DIR
#PKG
