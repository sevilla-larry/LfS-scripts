# a.08.11.Readline-8.2.sh
#

export PKG="readline-8.2"
export PKGLOG_DIR=$LFSLOG/08.11
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "   Patching..."
echo "   Patching..." >> $LFSLOG_PROCESS
echo "   Patching..." >> $PKGLOG_ERROR

sed -i '/MV.*old/d'             Makefile.in             >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
sed -i '/{OLDSUFF}/c:'          support/shlib-install   >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

patch -Np1 -i ../readline-8.2-upstream_fix-1.patch  \
     > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr                           \
            --disable-static                        \
            --with-curses                           \
            --docdir=/usr/share/doc/readline-8.2    \
    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make SHLIB_LIBS="-lncursesw"    \
    > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $LFSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make SHLIB_LIBS="-lncursesw" install        \
    > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -m644 doc/*.{ps,pdf,html,dvi}    \
    /usr/share/doc/readline-8.2             \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
#unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
