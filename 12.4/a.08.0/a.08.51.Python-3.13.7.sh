# a.08.51.Python-3.13.7.sh
# LfS 12.4 version
#

export PKG="Python-3.13.7"
export PKGLOG_DIR=$LFSLOG/08.51
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


echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr           \
            --enable-shared         \
            --with-system-expat     \
            --enable-optimizations  \
            --without-static-libpython  \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "   Some tests are known to occasionally hang indefinitely ..."
echo "   Some tests are known to occasionally hang indefinitely ..."    >> $LFSLOG_PROCESS
echo "   Some tests are known to occasionally hang indefinitely ..."    >> $PKGLOG_ERROR
echo "   So to test the results, run the test suite but set a 2-minute time limit for each test case ..."
echo "   So to test the results, run the test suite but set a 2-minute time limit for each test case ..."   >> $LFSLOG_PROCESS
echo "   So to test the results, run the test suite but set a 2-minute time limit for each test case ..."   >> $PKGLOG_ERROR
echo "   but set a 2-minute time limit for each test case ..."
echo "   but set a 2-minute time limit for each test case ..."          >> $LFSLOG_PROCESS
echo "   but set a 2-minute time limit for each test case ..."          >> $PKGLOG_ERROR

echo "4. Make Test ..."
echo "4. Make Test ..." >> $LFSLOG_PROCESS
echo "4. Make Test ..." >> $PKGLOG_ERROR
make test TESTOPTS="--timeout 120"  \
        > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# Read: https://www.linuxfromscratch.org/lfs/view/12.4/chapter08/Python.html
echo "   Suppress warnings..."
echo "   Suppress warnings..." >> $LFSLOG_PROCESS
echo "   Suppress warnings..." >> $PKGLOG_ERROR
cat > /etc/pip.conf << EOF 2>> $PKGLOG_ERROR
[global]
root-user-action = ignore
disable-pip-version-check = true
EOF

echo "   Install the preformatted documentation..."
echo "   Install the preformatted documentation..." >> $LFSLOG_PROCESS
echo "   Install the preformatted documentation..." >> $PKGLOG_ERROR
install -v -dm755 /usr/share/doc/python-3.13.7/html \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

tar --strip-components=1  \
    --no-same-owner       \
    --no-same-permissions \
    -C /usr/share/doc/python-3.13.7/html    \
    -xvf ../python-3.13.7-docs-html.tar.bz2 \
    >> $PKGLOG_TAR 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
