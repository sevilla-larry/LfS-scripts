# a.08.80.Sysklogd-1.5.1.sh
#

export PKG="sysklogd-1.5.1"
export PKGLOG_DIR=$LFSLOG/08.80
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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


echo "   Fix a problem that causes a segmentation fault in klogd under some conditions"
echo "   and fix an obsolete program construct..."
echo "   Fix a problem that causes a segmentation fault in klogd under some conditions"   >> $LFSLOG_PROCESS
echo "   and fix an obsolete program construct..."                                        >> $LFSLOG_PROCESS
echo "   Fix a problem that causes a segmentation fault in klogd under some conditions"   >> $PKGLOG_ERROR
echo "   and fix an obsolete program construct..."                                        >> $PKGLOG_ERROR
sed -i '/Error loading kernel symbols/{n;n;d}' ksym_mod.c   >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
sed -i 's/union wait/int/' syslogd.c                        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Make Build ..."
echo "2. Make Build ..." >> $LFSLOG_PROCESS
echo "2. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "3. Make Install ..."
echo "3. Make Install ..." >> $LFSLOG_PROCESS
echo "3. Make Install ..." >> $PKGLOG_ERROR
make BINDIR=/sbin install     \
     > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "   Create a new /etc/syslog.conf file..."
echo "   Create a new /etc/syslog.conf file..." >> $LFSLOG_PROCESS
echo "   Create a new /etc/syslog.conf file..." >> $PKGLOG_ERROR

cat > /etc/syslog.conf << "EOF"    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
# Begin /etc/syslog.conf

auth,authpriv.* -/var/log/auth.log
*.*;auth,authpriv.none -/var/log/sys.log
daemon.* -/var/log/daemon.log
kern.* -/var/log/kern.log
mail.* -/var/log/mail.log
user.* -/var/log/user.log
*.emerg *

# End /etc/syslog.conf
EOF


cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
#unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD
# PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
