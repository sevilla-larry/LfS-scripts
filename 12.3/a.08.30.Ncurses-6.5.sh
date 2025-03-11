# a.08.30.Ncurses-6.5.sh
#

export PKG="ncurses-6.5"
export PKGLOG_DIR=$LFSLOG/08.30
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --with-shared           \
            --without-debug         \
            --without-normal        \
            --with-cxx-shared       \
            --enable-pc-files       \
            --with-pkg-config-libdir=/usr/lib/pkgconfig \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make DESTDIR=$PWD/dest install  \
     > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -vm755 dest/usr/lib/libncursesw.so.6.5 /usr/lib \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
rm -v dest/usr/lib/libncursesw.so.6.5   \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
sed -e 's/^#if.*XOPEN.*$/#if 1/' \
    -i dest/usr/include/curses.h        \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
cp -av dest/* /                         \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "   Trick applications into linking with wide-character libraries by means of symlinks..."
echo "   Trick applications into linking with wide-character libraries by means of symlinks..." >> $LFSLOG_PROCESS
echo "   Trick applications into linking with wide-character libraries by means of symlinks..." >> $PKGLOG_ERROR
for lib in ncurses form panel menu ; do
    ln -sfv lib${lib}w.so /usr/lib/lib${lib}.so         >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
    ln -sfv ${lib}w.pc    /usr/lib/pkgconfig/${lib}.pc  >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
done

echo "   Make sure that old applications that look for -lcurses at build time are still buildable..."
echo "   Make sure that old applications that look for -lcurses at build time are still buildable..." >> $LFSLOG_PROCESS
echo "   Make sure that old applications that look for -lcurses at build time are still buildable..." >> $PKGLOG_ERROR
ln -sfv libncursesw.so /usr/lib/libcurses.so    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "   Install the Ncurses documentation..."
echo "   Install the Ncurses documentation..." >> $LFSLOG_PROCESS
echo "   Install the Ncurses documentation..." >> $PKGLOG_ERROR
cp -v -R doc -T /usr/share/doc/ncurses-6.5 \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
#unset PKGLOG_CHECK
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
