#!/bin/bash
# Remove any existing SNAT rule
/usr/sbin/iptables -t nat -D POSTROUTING -o eno1np0 -j SNAT --to-source 15.235.72.248

# Insert at position 1 (before all Docker rules)
/usr/sbin/iptables -t nat -I POSTROUTING 1 -o eno1np0 -j SNAT --to-source 15.235.72.248

echo "SNAT rule restored to position 1"
