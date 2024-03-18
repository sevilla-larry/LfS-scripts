# a.08.47.OpenSSL-3.2.1.sh
#

export PKG="openssl-3.2.1"
export PKGLOG_DIR=$LFSLOG/08.47
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export LFSLOG_PROCESS=$LFSLOG/process.log

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
./config --prefix=/usr             \
         --openssldir=/etc/ssl     \
         --libdir=lib              \
         shared                    \
         zlib-dynamic              \
         > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Check ..."
echo "4. Make Check ..." >> $LFSLOG_PROCESS
echo "4. Make Check ..." >> $PKGLOG_ERROR
HARNESS_JOBS=$(nproc) make test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile    \
      > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
make MANSUFFIX=ssl install    \
     >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "   Add the version to the documentation directory name..."
echo "   Add the version to the documentation directory name..." >> $LFSLOG_PROCESS
echo "   Add the version to the documentation directory name..." >> $PKGLOG_ERROR
mv -v /usr/share/doc/openssl /usr/share/doc/openssl-3.2.1   \
     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "   Install some additional documentation..."
echo "   Install some additional documentation..." >> $LFSLOG_PROCESS
echo "   Install some additional documentation..." >> $PKGLOG_ERROR
cp -vfr doc/* /usr/share/doc/openssl-3.2.1   \
     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
