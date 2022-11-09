# b.6.05.Coreutils-9.1.sh
#

export PKG="coreutils-9.1"
tar xvf $PKG.tar.xz
cd $PKG

time { \
\
./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --enable-install-program=hostname \
            --enable-no-install-program=kill,uptime && \
\
make && \
\
make DESTDIR=$LFS install && \
\
mv -v $LFS/usr/bin/chroot              $LFS/usr/sbin                    && \
mkdir -pv $LFS/usr/share/man/man8                                       && \
mv -v $LFS/usr/share/man/man1/chroot.1 $LFS/usr/share/man/man8/chroot.8 && \
sed -i 's/"1"/"8"/'                    $LFS/usr/share/man/man8/chroot.8    \
\
; }

cd ..
rm -rf $PKG
unset PKG
