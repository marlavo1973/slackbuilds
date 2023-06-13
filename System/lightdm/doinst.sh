config() {
  NEW="$1"
  OLD="$(dirname $NEW)/$(basename $NEW .new)"
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "$(cat $OLD | md5sum)" = "$(cat $NEW | md5sum)" ]; then
    rm $NEW
  fi
}

config etc/lightdm/lightdm.conf.new
config etc/lightdm/users.conf.new
config etc/lightdm/keys.conf.new
config etc/pam.d/lightdm.new
config etc/pam.d/lightdm-autologin.new
config etc/pam.d/lightdm-greeter.new
config etc/logrotate.d/lightdm.new
