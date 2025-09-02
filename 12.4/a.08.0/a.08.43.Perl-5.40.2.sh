# a.08.43.Perl-5.40.2.sh
# (errata)
#

export PKG="perl-5.40.2"
export PKGLOG_DIR=$LFSLOG/08.43
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $LFSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


patch -Np1 -i ../perl-5.40.2-upstream_fix-1.patch           \
    > $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

export BUILD_ZLIB=False
export BUILD_BZIP2=0

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
sh Configure -des                                           \
             -D prefix=/usr                                 \
             -D vendorprefix=/usr                           \
             -D privlib=/usr/lib/perl5/5.40/core_perl       \
             -D archlib=/usr/lib/perl5/5.40/core_perl       \
             -D sitelib=/usr/lib/perl5/5.40/site_perl       \
             -D sitearch=/usr/lib/perl5/5.40/site_perl      \
             -D vendorlib=/usr/lib/perl5/5.40/vendor_perl   \
             -D vendorarch=/usr/lib/perl5/5.40/vendor_perl  \
             -D man1dir=/usr/share/man/man1                 \
             -D man3dir=/usr/share/man/man3                 \
             -D pager="/usr/bin/less -isR"                  \
             -D useshrplib                                  \
             -D usethreads                                  \
             > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Check ..."
echo "4. Make Check ..." >> $LFSLOG_PROCESS
echo "4. Make Check ..." >> $PKGLOG_ERROR
TEST_JOBS=$(nproc) make test_harness    \
        > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

unset BUILD_ZLIB BUILD_BZIP2


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_CHECK
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
