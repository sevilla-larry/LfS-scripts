# a.08.91.02.GPM-1.20.7.sh
#

export PKG="gpm-1.20.7"
export PKGLOG_DIR=$LFSLOG/08.91.02
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.bz2 > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. Patching..."
echo "2. Patching..." >> $LFSLOG_PROCESS
echo "2. Patching..." >> $PKGLOG_ERROR
patch -Np1 -i ../gpm-1.20.7-consolidated-1.patch    \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
patch -Np1 -i ../gpm-1.20.7-gcc15_fixes-1.patch     \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "3. Autogen ..."
echo "3. Autogen ..." >> $LFSLOG_PROCESS
echo "3. Autogen ..." >> $PKGLOG_ERROR
./autogen.sh >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "4. Configure ..."
echo "4. Configure ..." >> $LFSLOG_PROCESS
echo "4. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr       \
            --sysconfdir=/etc   \
            ac_cv_path_emacs=no \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "5. Make Build ..."
echo "5. Make Build ..." >> $LFSLOG_PROCESS
echo "5. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "6. Make Install ..."
echo "6. Make Install ..." >> $LFSLOG_PROCESS
echo "6. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install-info --dir-file=/usr/share/info/dir \
             /usr/share/info/gpm.info       \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

rm -fv /usr/lib/libgpm.a                    \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
ln -sfv libgpm.so.2.1.0 /usr/lib/libgpm.so  \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
install -v -m644 conf/gpm-root.conf /etc    \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

#install -v -m755 -d /usr/share/doc/gpm-1.20.7/support   \
#    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
#install -v -m644    doc/support/*                       \
#                    /usr/share/doc/gpm-1.20.7/support   \
#    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
#install -v -m644    doc/{FAQ,HACK_GPM,README*}          \
#                    /usr/share/doc/gpm-1.20.7           \
#    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

# Configure Mouse
cat > /etc/sysconfig/mouse << "EOF" 2>> $PKGLOG_ERROR
# Begin /etc/sysconfig/mouse

MDEVICE="/dev/input/mice"
PROTOCOL="imps2"
GPMOPTS=""

# End /etc/sysconfig/mouse
EOF

echo "."
echo "."                                                >> $LFSLOG_PROCESS
echo "GPM installed but NOT configured"
echo "GPM installed but NOT configured"                 >> $LFSLOG_PROCESS
echo "."
echo "."                                                >> $LFSLOG_PROCESS
echo "Configure GPM after installing BLFS-bootscripts"
echo "Configure GPM after installing BLFS-bootscripts"  >> $LFSLOG_PROCESS
echo "."
echo "."                                                >> $LFSLOG_PROCESS


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
#unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
