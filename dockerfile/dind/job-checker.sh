#!/bin/bash
set -e
  
sleep 10m
while ! pgrep -f /azp/bin/Agent.Worker > /dev/null 2>&1; do
    log warning "Agent is not running any Pipeline Job"
    log warning "Agent is exiting with 0"
    pkill -SIGHUP -f "./run.sh" || true
    sleep 5m
done