# a.8.26.GCC-12.2.0.Part3.sh
# Install

export PKG="gcc-12.2.0"
export PKGLOG_DIR=$LFSLOG/8.26
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_CHOWN=$PKGLOG_DIR/chown.log
export LFSLOG_PROCESS=$LFSLOG/process.log

#rm -r $PKGLOG_DIR 2> /dev/null
#mkdir $PKGLOG_DIR

cd $PKG


cd   build

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

chown -v -R root:root
    /usr/lib/gcc/$(gcc -dumpmachine)/12.2.0/include{,-fixed}
    >> $PKGLOG_CHOWN 2>> $PKGLOG_ERROR

ln -sr /usr/bin/cpp /usr/lib

ln -sf ../../libexec/gcc/$(gcc -dumpmachine)/12.2.0/liblto_plugin.so
        /usr/lib/bfd-plugins/


cd ..
cd ..
#rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKGLOG_CHOWN PKG
