# a.08.91.23.boost-1.89.0.sh
#

export PKG="boost-1.89.0"
export PKGLOG_DIR=$LFSLOG/08.91.23
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
tar xvf $PKG-b2-nodocs.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


#echo "   Patching ..."
#echo "   Patching ..." >> $LFSLOG_PROCESS
#echo "   Patching ..." >> $PKGLOG_ERROR
#case $(uname -m) in
#   i?86)
#      sed -e "s/defined(__MINGW32__)/& || defined(__i386__)/" \
#          -i ./libs/stacktrace/src/exception_headers.h ;;
#esac    > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. BootStrap ..."
echo "2. BootStrap ..." >> $LFSLOG_PROCESS
echo "2. BootStrap ..." >> $PKGLOG_ERROR
./bootstrap.sh  --prefix=/usr           \
                --with-python=python3   \
                > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. B2 Build ..."
echo "3. B2 Build ..." >> $LFSLOG_PROCESS
echo "3. B2 Build ..." >> $PKGLOG_ERROR
./b2 stage $MAKEFLAGS threading=multi link=shared   \
         > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

#
# Note this test hangs on VMs
# VB so far working
echo "4. Regression Tests ..."
echo "4. Regression Tests ..." >> $LFSLOG_PROCESS
echo "4. Regression Tests ..." >> $PKGLOG_ERROR
pushd tools/build/test
    python3 test_all.py   \
         > $PKGLOG_CHECK 2>> $PKGLOG_ERROR
popd

#echo "5. Library Regression Tests ..."
#echo "5. Library Regression Tests ..." >> $LFSLOG_PROCESS
#echo "5. Library Regression Tests ..." >> $PKGLOG_ERROR
#pushd status
#    ../b2 $MAKEFLAGS  \
#        >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
#popd

echo "5. B2 Install ..."
echo "5. B2 Install ..." >> $LFSLOG_PROCESS
echo "5. B2 Install ..." >> $PKGLOG_ERROR
./b2 install threading=multi link=shared  \
         > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
