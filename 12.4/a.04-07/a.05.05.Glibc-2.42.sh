# a.5.05.Glibc-2.42.sh
# errata
# Warning: LLVM 19.1.7 build FAILs with this version
#

export PKG="glibc-2.42"
export PKGLOG_DIR=$LFSLOG/05.05
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_CHECK1=$PKGLOG_DIR/check1.log
export PKGLOG_CHECK2=$PKGLOG_DIR/check2.log
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


echo "   Symbolic Link..."
echo "   Symbolic Link..." >> $LFSLOG_PROCESS
echo "   Symbolic Link..." >> $PKGLOG_ERROR
case $(uname -m) in
    i?86)   ln -sfv ld-linux.so.2 $LFS/lib/ld-lsb.so.3
    ;;
    x86_64) ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64
            ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so.3
    ;;
esac >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "   Patch to FHS-compliant..."
echo "   Patch to FHS-compliant..." >> $LFSLOG_PROCESS
echo "   Patch to FHS-compliant..." >> $PKGLOG_ERROR
patch -Np1 -i ../glibc-2.42-fhs-1.patch \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mkdir build
cd    build

echo "   Ensure that the ldconfig and sln utilities will be installed into /usr/sbin..."
echo "   Ensure that the ldconfig and sln utilities will be installed into /usr/sbin..." >> $LFSLOG_PROCESS
echo "   Ensure that the ldconfig and sln utilities will be installed into /usr/sbin..." >> $PKGLOG_ERROR
echo "rootsbindir=/usr/sbin" > configparms

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
../configure                                \
      --prefix=/usr                         \
      --host=$LFS_TGT                       \
      --build=$(../scripts/config.guess)    \
      --enable-kernel=5.4                   \
      --disable-nscd                        \
      libc_cv_slibdir=/usr/lib              \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
#      --with-headers=$LFS/usr/include       \  GLib-2.41

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR
#make -j1

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make DESTDIR=$LFS install   \
    > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "   Fix hard code path in ldd script..."
echo "   Fix hard code path in ldd script..." >> $LFSLOG_PROCESS
echo "   Fix hard code path in ldd script..." >> $PKGLOG_ERROR
sed '/RTLDLIST=/s@/usr@@g' -i $LFS/usr/bin/ldd  \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo 'int main(){}' | $LFS_TGT-gcc -x c - -v -Wl,--verbose  \
        &> $PKGLOG_CHECK1 2>> $PKGLOG_ERROR
readelf -l a.out | grep ': /lib'            \
    >> $PKGLOG_CHECK2 2>> $PKGLOG_ERROR
### output should be and should NOT contain /mnt/lfs:
# [Requesting program interpreter: /lib64/ld-linux-x86-64.so.2]

grep -E -o "$LFS/lib.*/S?crt[1in].*succeeded"   \
    $PKGLOG_CHECK1                              \
    >> $PKGLOG_CHECK2 2>> $PKGLOG_ERROR
### output should be:
# /mnt/lfs/lib/../lib/Scrt1.o succeeded
# /mnt/lfs/lib/../lib/crti.o succeeded
# /mnt/lfs/lib/../lib/crtn.o succeeded

grep -B3 "^ $LFS/usr/include"   \
    $PKGLOG_CHECK1              \
    >> $PKGLOG_CHECK2 2>> $PKGLOG_ERROR
### output should be:
# #include <...> search starts here:
#  /mnt/lfs/tools/lib/gcc/x86_64-lfs-linux-gnu/15.2.0/include
#  /mnt/lfs/tools/lib/gcc/x86_64-lfs-linux-gnu/15.2.0/include-fixed
#  /mnt/lfs/usr/include

grep 'SEARCH.*/usr/lib' $PKGLOG_CHECK1  \
    |sed 's|; |\n|g'                    \
    >> $PKGLOG_CHECK2 2>> $PKGLOG_ERROR
### output should be:
# SEARCH_DIR("=/mnt/lfs/tools/x86_64-lfs-linux-gnu/lib64")
# SEARCH_DIR("=/usr/local/lib64")
# SEARCH_DIR("=/lib64")
# SEARCH_DIR("=/usr/lib64")
# SEARCH_DIR("=/mnt/lfs/tools/x86_64-lfs-linux-gnu/lib")
# SEARCH_DIR("=/usr/local/lib")
# SEARCH_DIR("=/lib")
# SEARCH_DIR("=/usr/lib");

grep "/lib.*/libc.so.6 " $PKGLOG_CHECK1 \
    >> $PKGLOG_CHECK2 2>> $PKGLOG_ERROR
### output should be:
# attempt to open /mnt/lfs/usr/lib/libc.so.6 succeeded

grep found $PKGLOG_CHECK1   \
    >> $PKGLOG_CHECK2 2>> $PKGLOG_ERROR
### output should be:
# found ld-linux-x86-64.so.2 at /mnt/lfs/usr/lib/ld-linux-x86-64.so.2

rm -v a.out                             \
    >> $PKGLOG_CHECK1 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_CHECK1 PKGLOG_CHECK2
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
