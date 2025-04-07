# a.08.29.GCC-14.2.0.sh
#

#
# Note: read https://www.linuxfromscratch.org/lfs/view/12.2/chapter08/gcc.html
#

export PKG="gcc-14.2.0"
export PKGLOG_DIR=$LFSLOG/08.29
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


echo "   Change the default directory name for 64-bit libraries to lib..."
echo "   Change the default directory name for 64-bit libraries to lib..." >> $LFSLOG_PROCESS
echo "   Change the default directory name for 64-bit libraries to lib..." >> $PKGLOG_ERROR
case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
  ;;
esac    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mkdir build
cd    build

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
../configure --prefix=/usr              \
             LD=ld                      \
             --enable-languages=c,c++   \
             --enable-default-pie       \
             --enable-default-ssp       \
             --enable-host-pie          \
             --disable-multilib         \
             --disable-bootstrap        \
             --disable-fixincludes      \
             --with-system-zlib         \
             > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "   Set stack size to unlimited..."
echo "   Set stack size to unlimited..." >> $LFSLOG_PROCESS
echo "   Set stack size to unlimited..." >> $PKGLOG_ERROR
ulimit -s -H unlimited

echo "   Remove/fix several known test failures..."
echo "   Remove/fix several known test failures..." >> $LFSLOG_PROCESS
echo "   Remove/fix several known test failures..." >> $PKGLOG_ERROR
sed -e '/cpython/d'               -i ../gcc/testsuite/gcc.dg/plugin/plugin.exp              \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
sed -e 's/no-pic /&-no-pie /'     -i ../gcc/testsuite/gcc.target/i386/pr113689-1.c          \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
sed -e 's/300000/(1|300000)/'     -i ../libgomp/testsuite/libgomp.c-c++-common/pr109062.c   \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
sed -e 's/{ target nonpic } //' \
    -e '/GOTPCREL/d'              -i ../gcc/testsuite/gcc.target/i386/fentryname3.c         \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "4. Make Check 1 Test the results as a non-privileged user..."
echo "4. Make Check 1 Test the results as a non-privileged user..." >> $LFSLOG_PROCESS
echo "4. Make Check 1 Test the results as a non-privileged user..." >> $PKGLOG_ERROR
chown -vR tester . >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
su tester -c "PATH=$PATH make $MAKEFLAGS -k check" \
  > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "   Begin: Extract a summary of the test suite results..."
echo "   Begin: Extract a summary of the test suite results..." >> $LFSLOG_PROCESS
echo "   Begin: Extract a summary of the test suite results..." >> $PKGLOG_CHECK
echo "   Begin: Extract a summary of the test suite results..." >> $PKGLOG_ERROR
../contrib/test_summary \
  >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
echo "   End: Extract summary of the test suite results..."
echo "   End: Extract summary of the test suite results..." >> $LFSLOG_PROCESS
echo "   End: Extract summary of the test suite results..." >> $PKGLOG_CHECK
echo "   End: Extract summary of the test suite results..." >> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "   Change the ownership to the root user and group..."
echo "   Change the ownership to the root user and group..." >> $LFSLOG_PROCESS
echo "   Change the ownership to the root user and group..." >> $PKGLOG_ERROR
chown -vR root:root                                             \
    /usr/lib/gcc/$(gcc -dumpmachine)/14.2.0/include{,-fixed}    \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "   Create a symlink required by the FHS for historical reasons..."
echo "   Create a symlink required by the FHS for historical reasons..." >> $LFSLOG_PROCESS
echo "   Create a symlink required by the FHS for historical reasons..." >> $PKGLOG_ERROR
ln -svr /usr/bin/cpp /usr/lib   >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "   Create a symlink man page as a symlink..."
echo "   Create a symlink man page as a symlink..." >> $LFSLOG_PROCESS
echo "   Create a symlink man page as a symlink..." >> $PKGLOG_ERROR
ln -sv gcc.1 /usr/share/man/man1/cc.1   >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "   Add a compatibility symlink to enable building programs with Link Time Optimization (LTO)..."
echo "   Add a compatibility symlink to enable building programs with Link Time Optimization (LTO)..." >> $LFSLOG_PROCESS
echo "   Add a compatibility symlink to enable building programs with Link Time Optimization (LTO)..." >> $PKGLOG_ERROR
ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/14.2.0/liblto_plugin.so  \
        /usr/lib/bfd-plugins/   >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo 'int main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose &> dummy.log

echo "dummy.c" >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
cat dummy.log >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

readelf -l a.out | grep ': /lib'    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "." >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
echo "." >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
echo "." >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "   Make sure that we're set up to use the correct start files..."
echo "   Make sure that we're set up to use the correct start files..." >> $LFSLOG_PROCESS
echo "   Make sure that we're set up to use the correct start files..." >> $PKGLOG_ERROR
echo "grep -E -o '/usr/lib.*/S?crt[1in].*succeeded' dummy.log"  \
  >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
      grep -E -o '/usr/lib.*/S?crt[1in].*succeeded' dummy.log   \
  >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
echo "." >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "   Verify that the compiler is searching for the correct header files..."
echo "   Verify that the compiler is searching for the correct header files..." >> $LFSLOG_PROCESS
echo "   Verify that the compiler is searching for the correct header files..." >> $PKGLOG_ERROR
echo "grep -B4 '^ /usr/include' dummy.log"  \
  >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
      grep -B4 '^ /usr/include' dummy.log   \
  >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
echo "." >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "   Verify that the new linker is being used with the correct search paths..."
echo "   Verify that the new linker is being used with the correct search paths..." >> $LFSLOG_PROCESS
echo "   Verify that the new linker is being used with the correct search paths..." >> $PKGLOG_ERROR
echo "grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'" \
    >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
      grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'  \
    >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
echo "." >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "   Make sure that we're using the correct libc..."
echo "   Make sure that we're using the correct libc..." >> $LFSLOG_PROCESS
echo "   Make sure that we're using the correct libc..." >> $PKGLOG_ERROR
echo "grep "/lib.*/libc.so.6 " dummy.log" \
    >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
      grep "/lib.*/libc.so.6 " dummy.log  \
    >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
echo "." >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "   Make sure GCC is using the correct dynamic linker..."
echo "   Make sure GCC is using the correct dynamic linker..." >> $LFSLOG_PROCESS
echo "   Make sure GCC is using the correct dynamic linker..." >> $PKGLOG_ERROR
echo "grep found dummy.log" \
    >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
      grep found dummy.log  \
    >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
echo "." >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "   Once everything is working correctly, clean up the test files..."
echo "   Once everything is working correctly, clean up the test files..." >> $LFSLOG_PROCESS
echo "   Once everything is working correctly, clean up the test files..." >> $PKGLOG_ERROR
rm -v dummy.c a.out dummy.log   \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "   Finally, move a misplaced file..."
echo "   Finally, move a misplaced file..." >> $LFSLOG_PROCESS
echo "   Finally, move a misplaced file..." >> $PKGLOG_ERROR
mkdir -pv /usr/share/gdb/auto-load/usr/lib              \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKGLOG_OTHERS PKG
