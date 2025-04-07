# a.08.16.Tcl-8.6.14.sh
#

export PKG="tcl8.6.14"
export PKGLOG_DIR=$LFSLOG/08.16
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
tar xvf $PKG-src.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


SRCDIR=$(pwd)
cd unix

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr               \
            --mandir=/usr/share/man     \
            --disable-rpath             \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Remove References to Build Directory ..."
echo "4. Remove References to Build Directory ..." >> $LFSLOG_PROCESS
echo "4. Remove References to Build Directory ..." >> $PKGLOG_ERROR

sed -e "s|$SRCDIR/unix|/usr/lib|"   \
    -e "s|$SRCDIR|/usr/include|"    \
    -i tclConfig.sh                 \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

sed -e "s|$SRCDIR/unix/pkgs/tdbc1.1.7|/usr/lib/tdbc1.1.7|"  \
    -e "s|$SRCDIR/pkgs/tdbc1.1.7/generic|/usr/include|"     \
    -e "s|$SRCDIR/pkgs/tdbc1.1.7/library|/usr/lib/tcl8.6|"  \
    -e "s|$SRCDIR/pkgs/tdbc1.1.7|/usr/include|"             \
    -i pkgs/tdbc1.1.7/tdbcConfig.sh                         \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

sed -e "s|$SRCDIR/unix/pkgs/itcl4.2.4|/usr/lib/itcl4.2.4|"  \
    -e "s|$SRCDIR/pkgs/itcl4.2.4/generic|/usr/include|"     \
    -e "s|$SRCDIR/pkgs/itcl4.2.4|/usr/include|"             \
    -i pkgs/itcl4.2.4/itclConfig.sh                         \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

unset SRCDIR

echo "5. Make Test ..."
echo "5. Make Test ..." >> $LFSLOG_PROCESS
echo "5. Make Test ..." >> $PKGLOG_ERROR
make test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "6. Make Install ..."
echo "6. Make Install ..." >> $LFSLOG_PROCESS
echo "6. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "   Make the installed library writable so debugging symbols can be removed later..."
echo "   Make the installed library writable so debugging symbols can be removed later..." >> $LFSLOG_PROCESS
echo "   Make the installed library writable so debugging symbols can be removed later..." >> $PKGLOG_ERROR
chmod -v u+w /usr/lib/libtcl8.6.so  >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "7. Make Install Private Headers..."
echo "7. Make Install Private Headers..." >> $LFSLOG_PROCESS
echo "7. Make Install Private Headers..." >> $PKGLOG_ERROR
make install-private-headers    \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "   Make a necessary symbolic link..."
echo "   Make a necessary symbolic link..." >> $LFSLOG_PROCESS
echo "   Make a necessary symbolic link..." >> $PKGLOG_ERROR
ln -sfv tclsh8.6 /usr/bin/tclsh \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "   Rename a man page that conflicts with a Perl man page..."
echo "   Rename a man page that conflicts with a Perl man page..." >> $LFSLOG_PROCESS
echo "   Rename a man page that conflicts with a Perl man page..." >> $PKGLOG_ERROR
mv -v /usr/share/man/man3/{Thread,Tcl_Thread}.3 \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "8. Extract html tar..."
echo "8. Extract html tar..." >> $LFSLOG_PROCESS
echo "8. Extract html tar..." >> $PKGLOG_ERROR
cd ..
tar -xvf ../tcl8.6.14-html.tar.gz   \
    --strip-components=1            \
    >> $PKGLOG_TAR 2>> $PKGLOG_ERROR
mkdir -pv /usr/share/doc/tcl-8.6.14         >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -vr ./html/* /usr/share/doc/tcl-8.6.14   >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
