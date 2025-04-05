# a.08.91.32.NSS-3.98.sh
# errata
#

export PKG="nss-3.98"
export PKGLOG_DIR=$LFSLOG/08.91.32
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
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
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


patch -Np1 -i ../nss-3.98-standalone-1.patch    \
            > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

cd nss

echo "2. Make Build ..."
echo "2. Make Build ..." >> $LFSLOG_PROCESS
echo "2. Make Build ..." >> $PKGLOG_ERROR
make    BUILD_OPT=1                             \
        NSPR_INCLUDE_DIR=/usr/include/nspr      \
        USE_SYSTEM_ZLIB=1                       \
        ZLIB_LIBS=-lz                           \
        NSS_ENABLE_WERROR=0                     \
        $([ $(uname -m) = x86_64 ] && echo USE_64=1)                            \
        $([ -f /usr/include/sqlite3.h ] && echo NSS_USE_SYSTEM_SQLITE=1)        \
        > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

# Test TOO long
#
echo "3. Test ..."
echo "3. Test ..." >> $LFSLOG_PROCESS
echo "3. Test ..." >> $PKGLOG_ERROR
cd tests
HOST=localhost DOMSUF=localdomain ./all.sh  \
        > $PKGLOG_CHECK 2>> $PKGLOG_ERROR
#cp -v ../test_results/security/localhost.1/results.html $PKGLOG_DIR
#            >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR
cd ../

echo "4. Dist Install ..."
echo "4. Dist Install ..." >> $LFSLOG_PROCESS
echo "4. Dist Install ..." >> $PKGLOG_ERROR
cd ../dist

install -v -m755 Linux*/lib/*.so              /usr/lib              \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -m644 Linux*/lib/{*.chk,libcrmf.a} /usr/lib              \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -m755 -d                           /usr/include/nss      \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
cp -v -RL {public,private}/nss/*              /usr/include/nss      \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -m755 Linux*/bin/{certutil,nss-config,pk12util} /usr/bin \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -m644 Linux*/lib/pkgconfig/nss.pc  /usr/lib/pkgconfig    \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

ln -sfv ./pkcs11/p11-kit-trust.so /usr/lib/libnssckbi.so    \
            >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

# read: https://www.linuxfromscratch.org/blfs/view/12.1/postlfs/nss.html
# chk on make-ca...


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD
#unset PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
