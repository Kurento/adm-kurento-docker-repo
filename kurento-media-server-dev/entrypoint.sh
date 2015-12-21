#!/bin/bash
set -e

gdbbt() {
 tmp=$(tempfile);
 echo thread apply all bt >"$tmp";
 gdb -batch -nx -q -x "$tmp" -e "$1" -c "$2";
 rm -f "$tmp";
}

if [ ! -z "$COTURN_PORT_3478_TCP_ADDR" ]; then
  if [ ! -z "$COTURN_PORT_3478_TCP_PORT" ]; then
    # Generate WebRtcEndpoint configuration
    echo "stunServerAddress=$COTURN_PORT_3478_TCP_ADDR" > /etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini
    echo "stunServerPort=$COTURN_PORT_3478_TCP_PORT" >> /etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini
  fi
fi

# Remove ipv6 local loop until ipv6 is supported
cat /etc/hosts | sed '/::1/d' | tee /etc/hosts > /dev/null
ulimit -c
cat /proc/sys/kernel/core_pattern
/usr/bin/kurento-media-server $@ || result=$?
echo "Kurento media server exited with $result"
# This is ABORT
if [ $result == 134 ];
then
  gdbbt /usr/bin/kurento-media-server core | cat
fi
