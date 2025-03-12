# a.08.93Z.ntp-4.2.8p18.sh
#

export PKG="ntp-4.2.8p18"
export PKGLOG_DIR=$LFSLOG/08.93Z
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. Create the user and group..."
echo "2. Create the user and group..." >> $LFSLOG_PROCESS
echo "2. Create the user and group..." >> $PKGLOG_ERROR
groupadd -g 87 ntp                                          \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
useradd -c "Network Time Protocol" -d /var/lib/ntp -u 87    \
        -g ntp -s /bin/false ntp                            \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "   Fix a type issue ..."
echo "   Fix a type issue ..." >> $LFSLOG_PROCESS
echo "   Fix a type issue ..." >> $PKGLOG_ERROR
sed -e "s;pthread_detach(NULL);pthread_detach(0);"  \
    -i configure                                    \
       sntp/configure                               \
       >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "3. Configure ..."
echo "3. Configure ..." >> $LFSLOG_PROCESS
echo "3. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr                   \
            --bindir=/usr/sbin              \
            --sysconfdir=/etc               \
            --enable-linuxcaps              \
            --with-lineeditlibs=readline    \
            --docdir=/usr/share/doc/ntp-4.2.8p18    \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "4. Make Build ..."
echo "4. Make Build ..." >> $LFSLOG_PROCESS
echo "4. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "5. Make Check ..."
echo "5. Make Check ..." >> $LFSLOG_PROCESS
echo "5. Make Check ..." >> $PKGLOG_ERROR
make check > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "6. Make Install ..."
echo "6. Make Install ..." >> $LFSLOG_PROCESS
echo "6. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -o ntp -g ntp -d /var/lib/ntp    \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

#
# Adjust to your nearest NTP servers
#
cat > /etc/ntp.conf << "EOF"    2>> $PKGLOG_OTHERS
# Asia
# server 0.asia.pool.ntp.org

# Australia
# server 0.oceania.pool.ntp.org

# Europe
# server 0.europe.pool.ntp.org

# North America
# server 0.north-america.pool.ntp.org

# South America
# server 2.south-america.pool.ntp.org

driftfile /var/lib/ntp/ntp.drift
pidfile   /run/ntpd.pid
EOF

#
# Additional entries
#
cat >> /etc/ntp.conf << "EOF"   2>> $PKGLOG_OTHERS

# LAN
# server 192.168.1.xx

# Philippines
server ntp.pagasa.dost.gov.ph
server ph.pool.ntp.org

interface ignore wildcard

interface listen 127.0.0.1
#interface listen 192.168.1.xx
EOF

echo "."
echo "."                                                    >> $LFSLOG_PROCESS
echo "NTP installed, needs additional for start-up"
echo "NTP installed, needs additional for start-up"         >> $LFSLOG_PROCESS
echo "."
echo "."                                                    >> $LFSLOG_PROCESS
echo "Configure NTP after installing BLFS-bootscripts"
echo "Configure NTP after installing BLFS-bootscripts"      >> $LFSLOG_PROCESS
echo "."
echo "."                                                    >> $LFSLOG_PROCESS


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
