# d10.09.74.libxslt-1.1.42.sh
#

#
# Dependencies Required:
#
#               b10.09.72 libxml2-2.13.3
#
# Dependencies Recommended (at runtime):
#
#               b10.49.01 docbook-xml-4.5
#               b10.49.04 docbook-xsl-nons-1.79.2
#
# Dependencies Optional:
#
#               b10.09.42 libgcrypt-1.11.0
#

#
#   Recommended but needed by:
#
#               d10.09.17 GLib-2.80.4
#
#   Recommended by:
#
#               d10.04.20 Polkit-126
#               g12.39.03 LibreOffice-24.8.0
#
#   Optional by:
#
#               d20.24.03 xorgproto-2024.1
#				d20.24.05 libXdmcp-1.1.5
#				d20.24.07 libxcb-1.17.0
#               d20.25.34 Libdrm-2.4.122
#

export PKG="libxslt-1.1.42"
export PKGLOG_DIR=$LFSLOG/09.74
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
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
./configure --prefix=/usr                          \
            --disable-static                       \
            --docdir=/usr/share/doc/libxslt-1.1.42 \
          > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
#            PYTHON=/usr/bin/python3                \

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Check ..."
echo "4. Make Check ..." >> $LFSLOG_PROCESS
echo "4. Make Check ..." >> $PKGLOG_ERROR
make check > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
