# a.06.18.GCC-13.2.0-Pass2.sh
#

export PKG="gcc-13.2.0"
export PKGLOG_DIR=$LFSLOG/06.18
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log

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
mv mpfr-4.2.0 mpfr
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

echo "    If building on x86_64, change the default directory name for 64-bit libraries to {lib}..."
echo "    If building on x86_64, change the default directory name for 64-bit libraries to {lib}..." >> $LFSLOG_PROCESS
echo "    If building on x86_64, change the default directory name for 64-bit libraries to {lib}..." >> $PKGLOG_ERROR
case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64
  ;;
esac >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "    Override the building rule of libgcc and libstdc++ headers,"
echo "    Override the building rule of libgcc and libstdc++ headers," >> $LFSLOG_PROCESS
echo "    Override the building rule of libgcc and libstdc++ headers," >> $PKGLOG_ERROR
echo "    to allow building these libraries with POSIX threads support..."
echo "    to allow building these libraries with POSIX threads support..." >> $LFSLOG_PROCESS
echo "    to allow building these libraries with POSIX threads support..." >> $PKGLOG_ERROR
sed '/thread_header =/s/@.*@/gthr-posix.h/'                 \
    -i libgcc/Makefile.in libstdc++-v3/include/Makefile.in  \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mkdir build
cd    build

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
../configure                                  \
    --build=$(../config.guess)                \
    --host=$LFS_TGT                           \
    --target=$LFS_TGT                         \
    LDFLAGS_FOR_TARGET=-L$PWD/$LFS_TGT/libgcc \
    --prefix=/usr                             \
    --with-build-sysroot=$LFS                 \
    --enable-default-pie                      \
    --enable-default-ssp                      \
    --disable-nls                             \
    --disable-multilib                        \
    --disable-libatomic                       \
    --disable-libgomp                         \
    --disable-libquadmath                     \
    --disable-libsanitizer                    \
    --disable-libssp                          \
    --disable-libvtv                          \
    --enable-languages=c,c++                  \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make DESTDIR=$LFS install \
     > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "Create a utility symlink" >> $PKGLOG_OTHERS
echo "   Create a utility symlink..."
echo "   Create a utility symlink..." >> $LFSLOG_PROCESS
echo "   Create a utility symlink..." >> $PKGLOG_ERROR
ln -vs gcc $LFS/usr/bin/cc  \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
