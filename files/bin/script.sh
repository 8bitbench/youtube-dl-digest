#!/bin/bash
chown -R media:media /app

sleep 1;
/etc/init.d/cron start;

if [[ "1" == "1" ]]; then
  while true; do sleep 1000; done
fi
