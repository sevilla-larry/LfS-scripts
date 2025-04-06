# a.08.80.E2fsprogs-1.47.1.sh
#

export PKG="e2fsprogs-1.47.1"
export PKGLOG_DIR=$LFSLOG/08.80
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


mkdir build
cd    build

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
../configure --prefix=/usr         \
             --sysconfdir=/etc     \
             --enable-elf-shlibs   \
             --disable-libblkid    \
             --disable-libuuid     \
             --disable-uuidd       \
             --disable-fsck        \
             > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Check ..."
echo "4. Make Check ..." >> $LFSLOG_PROCESS
echo "4. Make Check ..." >> $PKGLOG_ERROR
make check > $PKGLOG_CHECK 2>> $PKGLOG_ERROR
# One test named m_assume_storage_prezeroed is known to fail.

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "   Remove useless static libraries..."
echo "   Remove useless static libraries..." >> $LFSLOG_PROCESS
echo "   Remove useless static libraries..." >> $PKGLOG_ERROR
rm -fv /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a  \
     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "   Unzip gzipped .info file and update the system dir file..."
echo "   Unzip gzipped .info file and update the system dir file..." >> $LFSLOG_PROCESS
echo "   Unzip gzipped .info file and update the system dir file..." >> $PKGLOG_ERROR
gunzip -v /usr/share/info/libext2fs.info.gz       \
     >> $PKGLOG_TAR 2>> $PKGLOG_ERROR
install-info -v --dir-file=/usr/share/info/dir    \
     /usr/share/info/libext2fs.info               \
     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "   Create and install some additional documentation..."
echo "   Create and install some additional documentation..." >> $LFSLOG_PROCESS
echo "   Create and install some additional documentation..." >> $PKGLOG_ERROR
makeinfo -o doc/com_err.info                 \
     ../lib/et/com_err.texinfo               \
     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
install -v -m644  doc/com_err.info           \
     /usr/share/info                         \
     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
install-info --dir-file=/usr/share/info/dir  \
     /usr/share/info/com_err.info            \
     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
