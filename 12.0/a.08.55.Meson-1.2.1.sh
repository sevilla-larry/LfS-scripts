# a.08.55.Meson-1.0.0.sh
#

export PKG="meson-1.2.1"
export PKGLOG_DIR=$LFSLOG/08.55
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
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


echo "2. Build ..."
echo "2. Build ..." >> $LFSLOG_PROCESS
echo "2. Build ..." >> $PKGLOG_ERROR
pip3 wheel      -w dist                 \
                --no-cache-dir          \
                --no-build-isolation    \
                --no-deps               \
                $PWD                    \
    > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "3. Install ..."
echo "3. Install ..." >> $LFSLOG_PROCESS
echo "3. Install ..." >> $PKGLOG_ERROR
pip3 install    --no-index              \
                --no-user               \
                --find-links dist       \
                meson                   \
     > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
     
install -vDm644 data/shell-completions/bash/meson   \
    /usr/share/bash-completion/completions/meson    \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -vDm644 data/shell-completions/zsh/_meson   \
    /usr/share/zsh/site-functions/_meson            \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
# unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
