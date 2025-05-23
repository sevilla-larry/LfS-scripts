# a.08.61.Gawk-5.3.0.sh
#

export PKG="gawk-5.3.0"
export PKGLOG_DIR=$LFSLOG/08.61
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


echo "   Ensure some unneeded files are not installed..."
echo "   Ensure some unneeded files are not installed..." >> $LFSLOG_PROCESS
echo "   Ensure some unneeded files are not installed..." >> $PKGLOG_ERROR
sed -i 's/extras//' Makefile.in    \
     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr     \
     > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Check ..."
echo "4. Make Check ..." >> $LFSLOG_PROCESS
echo "4. Make Check ..." >> $PKGLOG_ERROR
chown -vR tester .                      \
     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
su tester -c "PATH=$PATH make check"    \
     > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
rm -fv /usr/bin/gawk-5.3.0    \
     > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
make install >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "   Create man page as a symlink..."
echo "   Create man page as a symlink..." >> $LFSLOG_PROCESS
echo "   Create man page as a symlink..." >> $PKGLOG_ERROR
ln -sv gawk.1 /usr/share/man/man1/awk.1 \
     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "   Install the documentation..."
echo "   Install the documentation..." >> $LFSLOG_PROCESS
echo "   Install the documentation..." >> $PKGLOG_ERROR
mkdir -pv                                    /usr/share/doc/gawk-5.3.0     \
     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}}  /usr/share/doc/gawk-5.3.0     \
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
