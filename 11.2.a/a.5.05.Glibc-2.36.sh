# a.5.05.Glibc-2.36.sh
#

export PKG="glibc-2.36"
export PKGLOG_DIR=$LFSLOG/5.05
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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


echo "Patch 1 Security Fix" >> $PKGLOG_OTHERS
patch -Np1 -i ../glibc-2.36-security_fix-1.patch    >> $PKGLOG_OTHERS 2>> PKGLOG_ERROR

echo "Symbolic Link"        >> $PKGLOG_OTHERS
case $(uname -m) in
    i?86)   ln -sfv ld-linux.so.2 $LFS/lib/ld-lsb.so.3                          >> $PKGLOG_OTHERS 2>> PKGLOG_ERROR
    ;;
    x86_64) ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64                      >> $PKGLOG_OTHERS 2>> PKGLOG_ERROR
            ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so.3   >> $PKGLOG_OTHERS 2>> PKGLOG_ERROR
    ;;
esac

echo "Patch 2 FHS-compliant"    >> $PKGLOG_OTHERS
patch -Np1 -i ../glibc-2.36-fhs-1.patch             >> $PKGLOG_OTHERS 2>> PKGLOG_ERROR

mkdir build
cd    build

echo "rootsbindir=/usr/sbin" > configparms

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
../configure                                \
      --prefix=/usr                         \
      --host=$LFS_TGT                       \
      --build=$(../scripts/config.guess)    \
      --enable-kernel=3.2                   \
      --with-headers=$LFS/usr/include       \
      libc_cv_slibdir=/usr/lib              \
        > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

export OLD_MAKEFLAGS=$MAKEFLAGS
export MAKEFLAGS="-j1"

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make DESTDIR=$LFS install
    > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "Fix hard code path in 'ldd' script" >> $PKGLOG_OTHERS
sed '/RTLDLIST=/s@/usr@@g' -i $LFS/usr/bin/ldd  >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "Install 'limit.h' headers" >> $PKGLOG_OTHERS
$LFS/tools/libexec/gcc/$LFS_TGT/12.2.0/install-tools/mkheaders  >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

export MAKEFLAGS=$OLD_MAKEFLAGS
unset OLD_MAKEFLAGS


echo 'int main(){}' | $LFS_TGT-gcc -xc -
     > $PKGLOG_CHECK 2>> $PKGLOG_ERROR
readelf -l a.out | grep ld-linux
    >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
rm a.out

cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
