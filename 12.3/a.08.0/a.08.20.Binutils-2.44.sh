# a.08.20.Binutils-2.44.sh
#

export PKG="binutils-2.44"
export PKGLOG_DIR=$LFSLOG/08.20
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


mkdir build
cd    build

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
../configure --prefix=/usr          \
             --sysconfdir=/etc      \
             --enable-ld=default    \
             --enable-plugins       \
             --enable-shared        \
             --disable-werror       \
             --enable-64-bit-bfd    \
             --enable-new-dtags     \
             --with-system-zlib     \
             --enable-default-hash-style=gnu    \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
#             --enable-gold          \ LfS 12.2

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make tooldir=/usr   \
    > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Check ..."
echo "4. Make Check ..." >> $LFSLOG_PROCESS
echo "4. Make Check ..." >> $PKGLOG_ERROR
make -k check >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

# For a list of failed tests, run
# grep '^FAIL:' $(find -name '*.log')

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make tooldir=/usr install   \
    > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "   Remove a useless static libraries..."
echo "   Remove a useless static libraries..." >> $LFSLOG_PROCESS
echo "   Remove a useless static libraries..." >> $PKGLOG_ERROR
rm -rfv /usr/lib/lib{bfd,ctf,ctf-nobfd,gprofng,opcodes,sframe}.a    \
        /usr/share/doc/gprofng/                                     \
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
