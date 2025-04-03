# a.08.53.Wheel-0.41.1.sh
#

export PKG="wheel-0.41.1"
export PKGLOG_DIR=$LFSLOG/08.53
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
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
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. Make Build ..."
echo "2. Make Build ..." >> $LFSLOG_PROCESS
echo "2. Make Build ..." >> $PKGLOG_ERROR
pip3 wheel      -w dist                 \
                --no-cache-dir          \
                --no-build-isolation    \
                --no-deps               \
                $PWD                    \
        > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "3. Install ..."
echo "3. Install ..." >> $LFSLOG_PROCESS
echo "3. Install ..." >> $PKGLOG_ERROR
pip3 install    --no-index              \
                --no-user               \
                --find-links=dist       \
                wheel                   \
        > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL
unset PKGLOG_BUILD
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
