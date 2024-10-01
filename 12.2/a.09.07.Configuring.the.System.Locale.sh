# a.09.07.Configuring.the.System.Locale.sh
#

cat > /etc/profile << "EOF"
# Begin /etc/profile

for i in $(locale); do
  unset ${i%=*}
done

#if [[ "$TERM" = linux ]]; then
  export LANG=C.UTF-8
#else
#  export LANG=<ll>_<CC>.<charmap><@modifiers>
#fi

# End /etc/profile
EOF
