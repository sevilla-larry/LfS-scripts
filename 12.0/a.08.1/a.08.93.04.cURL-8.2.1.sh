# a.08.93.04.cURL-8.2.1.sh
#

export PKG="curl-8.2.1"
export PKGLOG_DIR=$LFSLOG/08.93.04
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export PKGLOG_OTHERS1=$PKGLOG_DIR/others1.log
export PKGLOG_OTHERS2=$PKGLOG_DIR/others2.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

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
./configure --prefix=/usr                   \
            --disable-static                \
            --with-openssl                  \
            --with-ca-path=/etc/ssl/certs   \
            --enable-ares                   \
            --with-libssh2                  \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
#            --enable-threaded-resolver      \ 8.10.1 ver

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Test ..."
echo "4. Make Test ..." >> $LFSLOG_PROCESS
echo "4. Make Test ..." >> $PKGLOG_ERROR
make test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

rm -vrf docs/examples/.deps     \
    > $PKGLOG_OTHERS   2>> $PKGLOG_ERROR

find docs \( -name Makefile\* -o        \
             -name \*.1       -o        \
             -name \*.3       -o        \
             -name CMakeLists.txt \) -delete    \
    >> $PKGLOG_OTHERS   2>> $PKGLOG_ERROR

cp -v -R docs -T /usr/share/doc/curl-8.2.1     \
    >> $PKGLOG_OTHERS   2>> $PKGLOG_ERROR


echo "." >> $PKGLOG_OTHERS1
echo "." >> $PKGLOG_OTHERS1
echo "." >> $PKGLOG_OTHERS2
echo "." >> $PKGLOG_OTHERS2
echo "Verification Tests" >> $PKGLOG_CHECK
echo "." >> $PKGLOG_OTHERS1
echo "." >> $PKGLOG_OTHERS2
curl    --trace-ascii $PKGLOG_OTHERS1               \
            https://www.example.com/                \
        >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
curl    --trace-ascii $PKGLOG_OTHERS2 --trace-time  \
            https://example.com/                    \
        >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
echo "." >> $PKGLOG_OTHERS1
echo "." >> $PKGLOG_OTHERS1
echo "." >> $PKGLOG_OTHERS2
echo "." >> $PKGLOG_OTHERS2
echo "debugdump.txt"    >> $PKGLOG_OTHERS1
echo "d.txt"            >> $PKGLOG_OTHERS2


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS2 PKGLOG_OTHERS1 PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
