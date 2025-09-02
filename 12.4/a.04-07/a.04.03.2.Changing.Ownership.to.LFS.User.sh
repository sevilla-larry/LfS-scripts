# a.04.03.2.Changing.Ownership.to.LFS.User.sh
#

chown -v lfs $LFS/{usr{,/*},var,etc,tools}
case $(uname -m) in
  x86_64) chown -v lfs $LFS/lib64 ;;
esac

chown -vR lfs:lfs $LFS/sources
#chown -vR lfs:lfs $LFS/sources/*
