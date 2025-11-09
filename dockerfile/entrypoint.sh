#!/bin/bash
set -e
  
log() {
  local level="$1"
  shift
  local msg="$*"
  local timestamp
  timestamp=$(date -u +'%Y-%m-%dT%H:%M:%S.%NZ')
  
  if [[ "$level" == "error" ]]; then
    echo "time=\"$timestamp\" level=$level msg=\"$msg\"" > /proc/1/fd/2
  else
    echo "time=\"$timestamp\" level=$level msg=\"$msg\"" > /proc/1/fd/1
  fi
}
  
export -f log
  
log info "Starting Docker Daemon"
  
./dockerd.sh &

log info "Waiting for Docker to be available"
  
timeout=60

while ! docker system info --format '{{.ServerVersion}}' > /dev/null 2>&1; do
  sleep 1
  timeout=$((timeout - 1))
  if [ $timeout -eq 0 ]; then
    log error "Docker daemon didn't start in time, timeout error"
    exit 1
  fi
done
  
log info "Docker is ready"
  
for arg in "$@"; do
  if [[ "$arg" == "--once" ]]; then
    log info "--once is detected, starting job-checker"
    ./job-checker.sh &
    break
  fi
done
  
log info "Starting Azure DevOps agent"
  
exec /azp/start.sh "$@"