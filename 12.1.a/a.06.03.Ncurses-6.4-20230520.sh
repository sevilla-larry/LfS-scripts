# a.06.03.Ncurses-6.4-20230520.sh
#

export PKG="ncurses-6.4-20230520"
export PKGLOG_DIR=$LFSLOG/06.03
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


echo "First, ensure that gawk is found first during configuration"  \
    >> $PKGLOG_OTHERS
sed -i s/mawk// configure   \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Build tic ..."
echo "2. Build tic ..." >> $LFSLOG_PROCESS
echo "2. Build tic ..." >> $PKGLOG_ERROR
mkdir build
pushd build
  ../configure       > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
  make -C include    > $PKGLOG_BUILD  2>> $PKGLOG_ERROR
  make -C progs tic >> $PKGLOG_BUILD  2>> $PKGLOG_ERROR
popd

echo "3. Configure ncurses ..."
echo "3. Configure ncurses ..." >> $LFSLOG_PROCESS
echo "3. Configure ncurses ..." >> $PKGLOG_ERROR
./configure --prefix=/usr                 \
            --host=$LFS_TGT               \
            --build=$(./config.guess)     \
            --mandir=/usr/share/man       \
            --with-manpage-format=normal  \
            --with-shared                 \
            --without-normal              \
            --with-cxx-shared             \
            --without-debug               \
            --without-ada                 \
            --disable-stripping           \
            --enable-widec                \
            >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "4. Make Build ..."
echo "4. Make Build ..." >> $LFSLOG_PROCESS
echo "4. Make Build ..." >> $PKGLOG_ERROR
make >> $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make DESTDIR=$LFS TIC_PATH=$(pwd)/build/progs/tic install       \
    > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

ln -s libncursesw.so $LFS/usr/lib/libncurses.so
sed -e 's/^#if.*XOPEN.*$/#if 1/' -i $LFS/usr/include/curses.h   \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
