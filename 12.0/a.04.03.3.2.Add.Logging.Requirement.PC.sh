# a.04.03.3.2.Add.Logging.Requirement.PC.sh
#

mkdir -pv $LFS/var/log/lfs
chmod -v a+wt $LFS/var/log/lfs
chown -vR lfs:lfs $LFS/var/log/lfs
