# a.04.03.3.1.Add.Logging.Requirement.VM.VB.sh
#

mkdir -pv $LFS/var/log
chmod -v a+wt $LFS/var/log
chown -vR lfs:lfs $LFS/var/log
chown -vR lfs:lfs $LFS/mnt/Src/lfs.log
ln -sfv $LFS/mnt/Src/lfs.log $LFS/var/log/lfs
