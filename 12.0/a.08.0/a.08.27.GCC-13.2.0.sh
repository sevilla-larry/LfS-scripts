# a.08.27.GCC-13.2.0.sh
#

#
# Note: read https://www.linuxfromscratch.org/lfs/view/12.0/chapter08/gcc.html
#

export PKG="gcc-13.2.0"
export PKGLOG_DIR=$LFSLOG/08.27
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


case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
  ;;
esac

mkdir build
cd    build

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
../configure --prefix=/usr            \
             LD=ld                    \
             --enable-languages=c,c++ \
             --enable-default-pie     \
             --enable-default-ssp     \
             --disable-multilib       \
             --disable-bootstrap      \
             --disable-fixincludes    \
             --with-system-zlib       \
             > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
#             --enable-host-pie          \  LfS 12.3

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Check 1 ..."
echo "4. Make Check 1 ..." >> $LFSLOG_PROCESS
echo "4. Make Check 1 ..." >> $PKGLOG_ERROR
ulimit -s 32768

chown -Rv tester . > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

su tester -c "PATH=$PATH make -k check" \
  > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

../contrib/test_summary \
  >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

chown -v -R root:root                                         \
    /usr/lib/gcc/$(gcc -dumpmachine)/13.2.0/include{,-fixed}  \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

ln -svr /usr/bin/cpp /usr/lib   >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

ln -sv gcc.1 /usr/share/man/man1/cc.1   >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/13.2.0/liblto_plugin.so  \
        /usr/lib/bfd-plugins/ >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo 'int main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose &> dummy.log

echo "dummy.c"  >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
cat dummy.log   >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

readelf -l a.out | grep ': /lib'  >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "." >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
echo "." >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
echo "." >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "grep -E -o '/usr/lib.*/S?crt[1in].*succeeded' dummy.log"  \
  >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
      grep -E -o '/usr/lib.*/S?crt[1in].*succeeded' dummy.log   \
  >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
echo "." >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "grep -B4 '^ /usr/include' dummy.log"  \
  >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
      grep -B4 '^ /usr/include' dummy.log   \
  >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
echo "." >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'" \
  >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
      grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'  \
  >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
echo "." >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "grep "/lib.*/libc.so.6 " dummy.log" \
  >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
      grep "/lib.*/libc.so.6 " dummy.log  \
  >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
echo "." >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "grep found dummy.log" \
  >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
      grep found dummy.log  \
  >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
echo "." >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

rm -v dummy.c a.out dummy.log  \
  >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

mkdir -pv /usr/share/gdb/auto-load/usr/lib              \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib \
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
