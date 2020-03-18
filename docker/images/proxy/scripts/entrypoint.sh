#!/bin/sh

# Add proxy upstream
if [ -n "$HTTP_PROXY" ]; then
  echo "$HTTP_PROXY" | sed -E 's/^http:\/\/(.*)@(.*):([0-9]+)\/?$/cache_peer \2 parent \3 0 login=\1 no-digest no-query/g' >> /etc/squid/squid.conf
  echo 'never_direct allow all' >> /etc/squid/squid.conf
fi

squid -N
