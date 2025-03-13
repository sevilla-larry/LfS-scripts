# a.07.02.Change.Ownership.to.root.User.sh
#

chown --from lfs -v -R root:root $LFS/{usr,lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) chown --from lfs -v -R root:root $LFS/lib64 ;;
esac

chown -vR root:root $LFS/sources
