# a.08.92.13.Libcap-2.73.with.PAM.sh
#

export PKG="libcap-2.73"
export PKGLOG_DIR=$LFSLOG/08.92.13
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


echo "2. Make Build ..."
echo "2. Make Build ..." >> $LFSLOG_PROCESS
echo "2. Make Build ..." >> $PKGLOG_ERROR
make -C pam_cap \
    > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
install -v -m755 pam_cap/pam_cap.so /usr/lib/security   \
     > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -m644 pam_cap/capability.conf /etc/security  \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

mv -v /etc/pam.d/system-auth{,.bak}                     \
         >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

cat > /etc/pam.d/system-auth << "EOF"   2>> $PKGLOG_ERROR
# Begin /etc/pam.d/system-auth

auth      optional    pam_cap.so
EOF

tail -n +3 /etc/pam.d/system-auth.bak >> /etc/pam.d/system-auth \
         >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

# Read: https://www.linuxfromscratch.org/blfs/view/12.3/postlfs/libcap.html Configuring Libcap


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
