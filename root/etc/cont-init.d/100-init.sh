#!/command/s6-env bash
#set -x
if [ ! -f /calibre-library/metadata.db ]; then
   echo "Initializing calibre-library..."
   cp -r /opt/calibre-library/* /calibre-library
   chown -R nobody:users /calibre-library
fi
if [ ! -d /calibre-autoscan ]; then
    mkdir /calibre-autoscan
    chown nobody:users /calibre-autoscan
fi
if [ ! -d /nobody/inbox ]; then
 mkdir /nobody-inbox
 chown nobody:users /calibre-autoscan
fi

export $(dbus-launch)
