# a.08.00.Part3.37-82.sh
# excludes 08.64 GRUB

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "08.37.Libtool-2.5.4"
echo "08.37.Libtool-2.5.4" >> $LFSLOG_PROCESS

time { bash a.08.37.Libtool-2.5.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.38.GDBM-1.26"
echo "08.38.GDBM-1.26" >> $LFSLOG_PROCESS

time { bash a.08.38.GDBM-1.26.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.39.Gperf-3.3"
echo "08.39.Gperf-3.3" >> $LFSLOG_PROCESS

time { bash a.08.39.Gperf-3.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.40.Expat-2.7.1"
echo "08.40.Expat-2.7.1" >> $LFSLOG_PROCESS

time { bash a.08.40.Expat-2.7.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.41.Inetutils-2.6"
echo "08.41.Inetutils-2.6" >> $LFSLOG_PROCESS

time { bash a.08.41.Inetutils-2.6.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.42.Less-679"
echo "08.42.Less-679" >> $LFSLOG_PROCESS

time { bash a.08.42.Less-679.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.43.Perl-5.42.0"
echo "08.43.Perl-5.42.0" >> $LFSLOG_PROCESS

time { bash a.08.43.Perl-5.42.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.44.XML-Parser-2.47"
echo "08.44.XML-Parser-2.47" >> $LFSLOG_PROCESS

time { bash a.08.44.XML-Parser-2.47.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.45.Intltool-0.51.0"
echo "08.45.Intltool-0.51.0" >> $LFSLOG_PROCESS

time { bash a.08.45.Intltool-0.51.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.46.Autoconf-2.72"
echo "08.46.Autoconf-2.72" >> $LFSLOG_PROCESS

time { bash a.08.46.Autoconf-2.72.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.47.Automake-1.18.1"
echo "08.47.Automake-1.18.1" >> $LFSLOG_PROCESS

time { bash a.08.47.Automake-1.18.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.48.OpenSSL-3.5.2"
echo "08.48.OpenSSL-3.5.2" >> $LFSLOG_PROCESS

time { bash a.08.48.OpenSSL-3.5.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.49.Libelf.from.Elfutils-0.193"
echo "08.49.Libelf.from.Elfutils-0.193" >> $LFSLOG_PROCESS

time { bash a.08.49.Libelf.from.Elfutils-0.193.sh; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.50.Libffi-3.5.2"
echo "08.50.Libffi-3.5.2" >> $LFSLOG_PROCESS

time { bash a.08.50.Libffi-3.5.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

# if   [ "$PYVER" -eq 12 ]; then
#
# 	echo "08.51.Python-3.12.11"
# 	echo "08.51.Python-3.12.11" >> $LFSLOG_PROCESS
# 	time { bash a.08.51.Python-3.12.11.sh ; }
#
# elif [ "$PYVER" -eq 13 ]; then
#
# 	echo "08.51.Python-3.13.7"
# 	echo "08.51.Python-3.13.7" >> $LFSLOG_PROCESS
# 	time { bash a.08.51.Python-3.13.7.sh ; }
#
# else
#
# 	echo "Error: PYVER must be 12 or 13"
# 	echo "Error: PYVER must be 12 or 13" >> $LFSLOG_PROCESS
#
# fi

case "$PYVER" in
    12)
		echo "08.51.Python-3.12.11"
		echo "08.51.Python-3.12.11" >> $LFSLOG_PROCESS
		time { bash a.08.51.Python-3.12.11.sh ; }
        ;;
    13)
		echo "08.51.Python-3.13.7"
		echo "08.51.Python-3.13.7" >> $LFSLOG_PROCESS
		time { bash a.08.51.Python-3.13.7.sh ; }
        ;;
    *)
		echo "Error: PYVER must be 12 or 13"
		echo "Error: PYVER must be 12 or 13" >> $LFSLOG_PROCESS
        ;;
esac

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.52.Flit-Core-3.12.0"
echo "08.52.Flit-Core-3.12.0" >> $LFSLOG_PROCESS

time { bash a.08.52.Flit-Core-3.12.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "a.08.53.Packaging-25.0"
echo "a.08.53.Packaging-25.0" >> $LFSLOG_PROCESS

time { bash a.08.53.Packaging-25.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.54.Wheel-0.46.1"
echo "08.54.Wheel-0.46.1" >> $LFSLOG_PROCESS

time { bash a.08.54.Wheel-0.46.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.55.Setuptools-80.9.0"
echo "08.55.Setuptools-80.9.0" >> $LFSLOG_PROCESS

time { bash a.08.55.Setuptools-80.9.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.56.Ninja-1.13.1"
echo "08.56.Ninja-1.13.1" >> $LFSLOG_PROCESS

time { bash a.08.56.Ninja-1.13.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.57.Meson-1.8.3"
echo "08.57.Meson-1.8.3" >> $LFSLOG_PROCESS

time { bash a.08.57.Meson-1.8.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.58.Kmod-34.2"
echo "08.58.Kmod-34.2" >> $LFSLOG_PROCESS

time { bash a.08.58.Kmod-34.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.59.Coreutils-9.7"
echo "08.59.Coreutils-9.7" >> $LFSLOG_PROCESS

time { bash a.08.59.Coreutils-9.7.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.60.Diffutils-3.12"
echo "08.60.Diffutils-3.12" >> $LFSLOG_PROCESS

time { bash a.08.60.Diffutils-3.12.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.61.Gawk-5.3.2"
echo "08.61.Gawk-5.3.2" >> $LFSLOG_PROCESS

time { bash a.08.61.Gawk-5.3.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.62.Findutils-4.10.0"
echo "08.62.Findutils-4.10.0" >> $LFSLOG_PROCESS

time { bash a.08.62.Findutils-4.10.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.63.Groff-1.23.0"
echo "08.63.Groff-1.23.0" >> $LFSLOG_PROCESS

time { bash a.08.63.Groff-1.23.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####
##### 08.64.GRUB is on the later part 08.90.GRUB.....
#####

echo "08.65.Gzip-1.14"
echo "08.65.Gzip-1.14" >> $LFSLOG_PROCESS

time { bash a.08.65.Gzip-1.14.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.66.IPRoute2-6.16.0"
echo "08.66.IPRoute2-6.16.0" >> $LFSLOG_PROCESS

time { bash a.08.66.IPRoute2-6.16.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.67.Kbd-2.8.0"
echo "08.67.Kbd-2.8.0" >> $LFSLOG_PROCESS

time { bash a.08.67.Kbd-2.8.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.68.Libpipeline-1.5.8"
echo "08.68.Libpipeline-1.5.8" >> $LFSLOG_PROCESS

time { bash a.08.68.Libpipeline-1.5.8.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.69.Make-4.4.1"
echo "08.69.Make-4.4.1" >> $LFSLOG_PROCESS

time { bash a.08.69.Make-4.4.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.70.Patch-2.8"
echo "08.70.Patch-2.8" >> $LFSLOG_PROCESS

time { bash a.08.70.Patch-2.8.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.71.Tar-1.35"
echo "08.71.Tar-1.35" >> $LFSLOG_PROCESS

time { bash a.08.71.Tar-1.35.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.72.Texinfo-7.2"
echo "08.72.Texinfo-7.2" >> $LFSLOG_PROCESS

time { bash a.08.72.Texinfo-7.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.73a.Nano-8.6"
echo "08.73a.Nano-8.6" >> $LFSLOG_PROCESS

time { bash a.08.73a.Nano-8.6.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.74.MarkupSafe-3.0.2"
echo "08.74.MarkupSafe-3.0.2" >> $LFSLOG_PROCESS

time { bash a.08.74.MarkupSafe-3.0.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.75.Jinja2-3.1.6"
echo "08.75.Jinja2-3.1.6" >> $LFSLOG_PROCESS

time { bash a.08.75.Jinja2-3.1.6.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.76.Udev.from.Systemd-257.8"
echo "08.76.Udev.from.Systemd-257.8" >> $LFSLOG_PROCESS

time { bash a.08.76.Udev.from.Systemd-257.8.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.77.Man-DB-2.13.1"
echo "08.77.Man-DB-2.13.1" >> $LFSLOG_PROCESS

time { bash a.08.77.Man-DB-2.13.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.78.Procps-ng-4.0.5"
echo "08.78.Procps-ng-4.0.5" >> $LFSLOG_PROCESS

time { bash a.08.78.Procps-ng-4.0.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.79.Util-linux-2.41.1"
echo "08.79.Util-linux-2.41.1" >> $LFSLOG_PROCESS

time { bash a.08.79.Util-linux-2.41.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.80.E2fsprogs-1.47.3"
echo "08.80.E2fsprogs-1.47.3" >> $LFSLOG_PROCESS

time { bash a.08.80.E2fsprogs-1.47.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.81.Sysklogd-2.7.2"
echo "08.81.Sysklogd-2.7.2" >> $LFSLOG_PROCESS

time { bash a.08.81.Sysklogd-2.7.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "08.82.Sysvinit-3.14"
echo "08.82.Sysvinit-3.14" >> $LFSLOG_PROCESS

time { bash a.08.82.Sysvinit-3.14.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
