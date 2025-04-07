# a.06.17.Binutils-2.43.1.-Pass2.sh
#

export PKG="binutils-2.43.1"
export PKGLOG_DIR=$LFSLOG/06.17
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
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


echo "   Work around some issue..."
echo "   Work around some issue..." >> $LFSLOG_PROCESS
echo "   Work around some issue..." >> $PKGLOG_ERROR
sed '6009s/$add_dir//' -i ltmain.sh \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mkdir build
cd    build

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
../configure                        \
    --prefix=/usr                   \
    --build=$(../config.guess)      \
    --host=$LFS_TGT                 \
    --disable-nls                   \
    --enable-shared                 \
    --enable-gprofng=no             \
    --disable-werror                \
    --enable-64-bit-bfd             \
    --enable-new-dtags              \
    --enable-default-hash-style=gnu \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make DESTDIR=$LFS install   \
    > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "   Remove the libtool archive file because it is harmful for cross compilation,"
echo "   Remove the libtool archive file because it is harmful for cross compilation," >> $LFSLOG_PROCESS
echo "   Remove the libtool archive file because it is harmful for cross compilation," >> $PKGLOG_ERROR
echo "   and remove unnecessary static libraries..."
echo "   and remove unnecessary static libraries..." >> $LFSLOG_PROCESS
echo "   and remove unnecessary static libraries..." >> $PKGLOG_ERROR
rm -v $LFS/usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes,sframe}.{a,la} \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
