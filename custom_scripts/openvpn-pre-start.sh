#!/bin/sh
# Mount this script at /scripts at runtime.

# default variables
protonvpn_ovpn_loc="${PROTONVPN_OVPN_LOC:-/etc/openvpn/protonvpn}"
protonvpn_ovpn_state_code="${PROTONVPN_OVPN_STATE_CODE:-*}"
protonvpn_ovpn_proto="${PROTONVPN_OVPN_PROTO:-udp}"

rand_ovpn=$(ls $protonvpn_ovpn_loc/us-$protonvpn_ovpn_state_code-*.protonvpn.com.$protonvpn_ovpn_proto.ovpn | xargs shuf -n1 -e)

echo "setting $rand_ovpn to default.ovpn"
rm $protonvpn_ovpn_loc/default.ovpn
ln -s $rand_ovpn $protonvpn_ovpn_loc/default.ovpn