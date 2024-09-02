# a.06.05.Coreutils-9.5.sh
#

export PKG="coreutils-9.5"
export PKGLOG_DIR=$LFSLOG/06.05
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log

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
./configure --prefix=/usr                           \
            --host=$LFS_TGT                         \
            --build=$(build-aux/config.guess)       \
            --enable-install-program=hostname       \
            --enable-no-install-program=kill,uptime \
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

echo "   Move programs to their final expected locations..."
echo "   Move programs to their final expected locations..."    >> $LFSLOG_PROCESS
echo "   Move programs to their final expected locations..."    >> $PKGLOG_ERROR
mv    -v    $LFS/usr/bin/chroot                 $LFS/usr/sbin                       \
            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
mkdir -pv   $LFS/usr/share/man/man8                                                 \
            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
mv    -v    $LFS/usr/share/man/man1/chroot.1    $LFS/usr/share/man/man8/chroot.8    \
            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
sed         -i 's/"1"/"8"/'                     $LFS/usr/share/man/man8/chroot.8    \
            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
