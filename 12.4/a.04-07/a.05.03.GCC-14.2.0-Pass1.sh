# a.05.03.GCC-14.2.0-Pass1.sh
#

export PKG="gcc-14.2.0"
export PKGLOG_DIR=$LFSLOG/05.03
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

echo "1.0 Extract tar GCC..."
echo "1.0 Extract tar GCC..." >> $LFSLOG_PROCESS
echo "1.0 Extract tar GCC..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "1.1 Extract tar MPFR ."
echo "1.1 Extract tar MPFR ." >> $LFSLOG_PROCESS
echo "1.1 Extract tar MPFR ." >> $PKGLOG_ERROR
tar -xvf ../mpfr-4.2.1.tar.xz >> $PKGLOG_TAR 2>> $PKGLOG_ERROR
mv mpfr-4.2.1 mpfr

echo "1.2 Extract tar GMP ."
echo "1.2 Extract tar GMP ." >> $LFSLOG_PROCESS
echo "1.2 Extract tar GMP ." >> $PKGLOG_ERROR
tar -xvf ../gmp-6.3.0.tar.xz >> $PKGLOG_TAR 2>> $PKGLOG_ERROR
mv gmp-6.3.0 gmp

echo "1.3 Extract tar MPC ."
echo "1.3 Extract tar MPC ." >> $LFSLOG_PROCESS
echo "1.3 Extract tar MPC ." >> $PKGLOG_ERROR
tar -xvf ../mpc-1.3.1.tar.gz >> $PKGLOG_TAR 2>> $PKGLOG_ERROR
mv mpc-1.3.1 mpc

echo "    Default directory for 64-bit lib"
echo "    Default directory for 64-bit lib" >> $LFSLOG_PROCESS
echo "    Default directory for 64-bit lib" >> $PKGLOG_ERROR
case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
 ;;
esac >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mkdir build
cd    build

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
../configure                  \
    --target=$LFS_TGT         \
    --prefix=$LFS/tools       \
    --with-glibc-version=2.42 \
    --with-sysroot=$LFS       \
    --with-newlib             \
    --without-headers         \
    --enable-default-pie      \
    --enable-default-ssp      \
    --disable-nls             \
    --disable-shared          \
    --disable-multilib        \
    --disable-threads         \
    --disable-libatomic       \
    --disable-libgomp         \
    --disable-libquadmath     \
    --disable-libssp          \
    --disable-libvtv          \
    --disable-libstdcxx       \
    --enable-languages=c,c++  \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "   Create a full version of the internal header using a command that is"
echo "   identical to what the GCC build system does in normal circumstances"
echo "   Create a full version of the internal header using a command that is"  >> $LFSLOG_PROCESS
echo "   identical to what the GCC build system does in normal circumstances"   >> $LFSLOG_PROCESS
echo "   Create a full version of the internal header using a command that is"  >> $PKGLOG_ERROR
echo "   identical to what the GCC build system does in normal circumstances"   >> $PKGLOG_ERROR
cd ..
cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
  `dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/include/limits.h    \
   2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
