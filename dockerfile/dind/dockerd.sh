#!/bin/bash
set -e
  
sudo ln -sf /proc/1/fd/1 /var/log/docker.log
sudo service docker start
  
while true; do
  if ! pgrep -f /usr/bin/dockerd > /dev/null; then
    log warning "Restarting Docker Daemon"
    sudo service docker restart
  fi
  sleep 30s
done