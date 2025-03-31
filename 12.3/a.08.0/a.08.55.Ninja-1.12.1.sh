# a.08.55.Ninja-1.12.1.sh
#

export PKG="ninja-1.12.1"
export PKGLOG_DIR=$LFSLOG/08.55
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


#Number of Parallel processes
export NINJAJOBS=$(nproc)

sed -i '/int Guess/a \
  int   j = 0;\
  char* jobs = getenv( "NINJAJOBS" );\
  if ( jobs != NULL ) j = atoi( jobs );\
  if ( j > 0 ) return j;\
' src/ninja.cc                          \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Build ..."
echo "2. Build ..." >> $LFSLOG_PROCESS
echo "2. Build ..." >> $PKGLOG_ERROR
python3 configure.py    \
        --bootstrap     \
        --verbose       \
    > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

# The package tests cannot run in the chroot environment. They require cmake.

echo "3. Install ..."
echo "3. Install ..." >> $LFSLOG_PROCESS
echo "3. Install ..." >> $PKGLOG_ERROR
install -vm755 ninja /usr/bin/                      \
     > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -vDm644 misc/bash-completion                \
    /usr/share/bash-completion/completions/ninja    \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -vDm644 misc/zsh-completion                 \
    /usr/share/zsh/site-functions/_ninja            \
    >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
#unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
