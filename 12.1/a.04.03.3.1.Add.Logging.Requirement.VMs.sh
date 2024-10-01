# a.04.03.3.1.Add.Logging.Requirement.VMs.sh
#

mkdir -pv $LFS/var/log
chmod -v a+wt $LFS/var/log
chown -v lfs:lfs $LFS/var/log
chown -v lfs:lfs $LFS/mnt/Src/lfs.log
ln -sfv $LFS/mnt/Src/lfs.log $LFS/var/log/lfs
