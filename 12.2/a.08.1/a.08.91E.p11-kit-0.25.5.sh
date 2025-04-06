# a.08.91E.p11-kit-0.25.5.sh
#

export PKG="p11-kit-0.25.5"
export PKGLOG_DIR=$LFSLOG/08.91E
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
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "   Prepare the distribution specific anchor hook..."
echo "   Prepare the distribution specific anchor hook..." >> $LFSLOG_PROCESS
echo "   Prepare the distribution specific anchor hook..." >> $PKGLOG_ERROR
sed '20,$ d' -i trust/trust-extract-compat  >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cat >> trust/trust-extract-compat << "EOF"      2>> $PKGLOG_ERROR
# Copy existing anchor modifications to /etc/ssl/local
/usr/libexec/make-ca/copy-trust-modifications

# Update trust stores
/usr/sbin/make-ca -r
EOF

mkdir p11-build
cd    p11-build

echo "2. Meson Configure ..."
echo "2. Meson Configure ..." >> $LFSLOG_PROCESS
echo "2. Meson Configure ..." >> $PKGLOG_ERROR
meson   setup ..                        \
        --prefix=/usr                   \
        --buildtype=release             \
        -D trust_paths=/etc/pki/anchors \
        > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Test ..."
echo "4. Ninja Test ..." >> $LFSLOG_PROCESS
echo "4. Ninja Test ..." >> $PKGLOG_ERROR
LC_ALL=C ninja test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Ninja Install ..."
echo "5. Ninja Install ..." >> $LFSLOG_PROCESS
echo "5. Ninja Install ..." >> $PKGLOG_ERROR
ninja install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

ln -sfv /usr/libexec/p11-kit/trust-extract-compat   \
        /usr/bin/update-ca-certificates             \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
