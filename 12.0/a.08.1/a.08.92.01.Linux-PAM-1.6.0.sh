# a.08.92.01.Linux-PAM-1.6.0.sh
# errata
#

export PKG="Linux-PAM-1.6.0"
export PKGLOG_DIR=$LFSLOG/08.92.01
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
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


sed -e /service_DATA/d                      \
    -i modules/pam_namespace/Makefile.am    \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
autoreconf  -v                              \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

tar -xvf ../Linux-PAM-1.6.0-docs.tar.xz     \
            --strip-components=1            \
    >> $PKGLOG_TAR 2>> $PKGLOG_ERROR

echo "2. Configure ..."
echo "2. Configure ..." >> $LFSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr                           \
            --sbindir=/usr/sbin                     \
            --sysconfdir=/etc                       \
            --libdir=/usr/lib                       \
            --enable-securedir=/usr/lib/security    \
            --docdir=/usr/share/doc/Linux-PAM-1.6.0 \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $LFSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

# For a first-time installation
# create a configuration file
install -v -m755 -d /etc/pam.d    \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

cat > /etc/pam.d/other << "EOF" 2>> $PKGLOG_ERROR
auth     required       pam_deny.so
account  required       pam_deny.so
password required       pam_deny.so
session  required       pam_deny.so
EOF

echo "4. Make Check ..."
echo "4. Make Check ..." >> $LFSLOG_PROCESS
echo "4. Make Check ..." >> $PKGLOG_ERROR
make check > $PKGLOG_CHECK >> $PKGLOG_ERROR


# remove the configuration file
rm -fv /etc/pam.d/other \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $LFSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

chmod -v 4755 /usr/sbin/unix_chkpwd \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

### Configurations

install -vdm755 /etc/pam.d  \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

cat > /etc/pam.d/system-account << "EOF"    2>> $PKGLOG_ERROR
# Begin /etc/pam.d/system-account

account   required    pam_unix.so

# End /etc/pam.d/system-account
EOF

cat > /etc/pam.d/system-auth << "EOF"       2>> $PKGLOG_ERROR
# Begin /etc/pam.d/system-auth

auth      required    pam_unix.so

# End /etc/pam.d/system-auth
EOF

cat > /etc/pam.d/system-session << "EOF"    2>> $PKGLOG_ERROR
# Begin /etc/pam.d/system-session

session   required    pam_unix.so

# End /etc/pam.d/system-session
EOF

cat > /etc/pam.d/system-password << "EOF"   2>> $PKGLOG_ERROR
# Begin /etc/pam.d/system-password

# use yescrypt hash for encryption, use shadow, and try to use any
# previously defined authentication token (chosen password) set by any
# prior module.
password  required    pam_unix.so       yescrypt shadow try_first_pass

# End /etc/pam.d/system-password
EOF

cat > /etc/pam.d/other << "EOF"             2>> $PKGLOG_ERROR
# Begin /etc/pam.d/other

auth        required        pam_warn.so
auth        required        pam_deny.so
account     required        pam_warn.so
account     required        pam_deny.so
password    required        pam_warn.so
password    required        pam_deny.so
session     required        pam_warn.so
session     required        pam_deny.so

# End /etc/pam.d/other
EOF

# from https://www.linuxfromscratch.org/blfs/view/12.0/postlfs/sudo.html

cat > /etc/pam.d/sudo << "EOF"              2>> $PKGLOG_ERROR
# Begin /etc/pam.d/sudo

# include the default auth settings
auth      include     system-auth

# include the default account settings
account   include     system-account

# Set default environment variables for the service user
session   required    pam_env.so

# include system session defaults
session   include     system-session

# End /etc/pam.d/sudo
EOF

chmod -v 644 /etc/pam.d/sudo    \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
