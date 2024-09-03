# a.08.76.Udev.from.Systemd-256.4.sh
#

export PKG="systemd-256.4"
export PKGLOG_DIR=$LFSLOG/08.76
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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


echo "   Remove two unneeded groups, render and sgx, from the default udev rules..."
echo "   Remove two unneeded groups, render and sgx, from the default udev rules..." >> $LFSLOG_PROCESS
echo "   Remove two unneeded groups, render and sgx, from the default udev rules..." >> $PKGLOG_ERROR
sed -i -e 's/GROUP="render"/GROUP="video"/'                     \
       -e 's/GROUP="sgx", //' rules.d/50-udev-default.rules.in  \
      >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "   Remove one udev rule requiring a full Systemd installation..."
echo "   Remove one udev rule requiring a full Systemd installation..." >> $LFSLOG_PROCESS
echo "   Remove one udev rule requiring a full Systemd installation..." >> $PKGLOG_ERROR
sed '/systemd-sysctl/s/^/#/' -i rules.d/99-systemd.rules.in     \
      >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "   Adjust the hardcoded paths to network configuration files for the standalone udev installation..."
echo "   Adjust the hardcoded paths to network configuration files for the standalone udev installation..." >> $LFSLOG_PROCESS
echo "   Adjust the hardcoded paths to network configuration files for the standalone udev installation..." >> $PKGLOG_ERROR
sed '/NETWORK_DIRS/s/systemd/udev/' -i src/basic/path-lookup.h  \
      >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mkdir build
cd    build

echo "2. Meson Setup ..."
echo "2. Meson Setup ..." >> $LFSLOG_PROCESS
echo "2. Meson Setup ..." >> $PKGLOG_ERROR
meson setup ..                  \
      --prefix=/usr             \
      --buildtype=release       \
      -D mode=release           \
      -D dev-kvm-mode=0660      \
      -D link-udev-shared=false \
      -D logind=false           \
      -D vconsole=false         \
      > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "   Get the list of the shipped udev helpers and save it into an environment variable..."
echo "   Get the list of the shipped udev helpers and save it into an environment variable..." >> $LFSLOG_PROCESS
echo "   Get the list of the shipped udev helpers and save it into an environment variable..." >> $PKGLOG_ERROR
export udev_helpers=$(grep "'name' :" ../src/udev/meson.build |           \
                      awk '{print $3}' | tr -d ",'" | grep -v 'udevadm')  \
      >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "3. Ninja Build ..."
echo "3. Ninja Build ..." >> $LFSLOG_PROCESS
echo "3. Ninja Build ..." >> $PKGLOG_ERROR
ninja udevadm systemd-hwdb                                            \
      $(ninja -n | grep -Eo '(src/(lib)?udev|rules.d|hwdb.d)/[^ ]*')  \
      $(realpath libudev.so --relative-to .)                          \
      $udev_helpers                                                   \
      > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Ninja Install ..."
echo "4. Ninja Install ..." >> $LFSLOG_PROCESS
echo "4. Ninja Install ..." >> $PKGLOG_ERROR
install -vm755 -d {/usr/lib,/etc}/udev/{hwdb.d,rules.d,network}           \
         > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -vm755 -d /usr/{lib,share}/pkgconfig                              \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -vm755 udevadm                             /usr/bin/              \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -vm755 systemd-hwdb                        /usr/bin/udev-hwdb     \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
ln      -svfn  ../bin/udevadm                      /usr/sbin/udevd        \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
cp      -av    libudev.so{,*[0-9]}                 /usr/lib/              \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -vm644 ../src/libudev/libudev.h            /usr/include/          \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -vm644 src/libudev/*.pc                    /usr/lib/pkgconfig/    \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -vm644 src/udev/*.pc                       /usr/share/pkgconfig/  \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -vm644 ../src/udev/udev.conf               /etc/udev/             \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -vm644 rules.d/* ../rules.d/README         /usr/lib/udev/rules.d/ \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -vm644 $(find ../rules.d/*.rules                                  \
                      -not -name '*power-switch*') /usr/lib/udev/rules.d/ \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -vm644 hwdb.d/*  ../hwdb.d/{*.hwdb,README} /usr/lib/udev/hwdb.d/  \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -vm755 $udev_helpers                       /usr/lib/udev          \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -vm644 ../network/99-default.link          /usr/lib/udev/network  \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "   Install some custom rules and support files useful in an LFS environment..."
echo "   Install some custom rules and support files useful in an LFS environment..." >> $LFSLOG_PROCESS
echo "   Install some custom rules and support files useful in an LFS environment..." >> $PKGLOG_ERROR
tar -xvf ../../udev-lfs-20230818.tar.xz \
        >> $PKGLOG_TAR 2>> $PKGLOG_ERROR
make -f udev-lfs-20230818/Makefile.lfs install  \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "   Install the man pages..."
echo "   Install the man pages..." >> $LFSLOG_PROCESS
echo "   Install the man pages..." >> $PKGLOG_ERROR
tar -xvf ../../systemd-man-pages-256.4.tar.xz                           \
    --no-same-owner --strip-components=1                              \
    -C /usr/share/man --wildcards '*/udev*' '*/libudev*'              \
                                  '*/systemd.link.5'                  \
                                  '*/systemd-'{hwdb,udevd.service}.8  \
        >> $PKGLOG_TAR 2>> $PKGLOG_ERROR

sed 's|systemd/network|udev/network|'                                 \
    /usr/share/man/man5/systemd.link.5                                \
  > /usr/share/man/man5/udev.link.5                                   \
      2>> $PKGLOG_ERROR
#      >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

sed 's/systemd\(\\\?-\)/udev\1/' /usr/share/man/man8/systemd-hwdb.8   \
                               > /usr/share/man/man8/udev-hwdb.8      \
      2>> $PKGLOG_ERROR
#      >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

sed 's|lib.*udevd|sbin/udevd|'                                        \
    /usr/share/man/man8/systemd-udevd.service.8                       \
  > /usr/share/man/man8/udevd.8                                       \
      2>> $PKGLOG_ERROR
#      >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

rm -v /usr/share/man/man*/systemd*                                    \
      >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "   Unset the udev_helpers variable..."
echo "   Unset the udev_helpers variable..." >> $LFSLOG_PROCESS
echo "   Unset the udev_helpers variable..." >> $PKGLOG_ERROR
unset udev_helpers  >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "   Create the initial database..."
echo "   Create the initial database..." >> $LFSLOG_PROCESS
echo "   Create the initial database..." >> $PKGLOG_ERROR
udev-hwdb update    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd ..
cd ..
rm -rf $PKG
unset LFSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_CHECK
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
