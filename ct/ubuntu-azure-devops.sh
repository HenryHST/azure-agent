#!/usr/bin/env bash
source <(curl -fsSL https://raw.githubusercontent.com/HenryHST/azure-agent/main/misc/build.func)
# Copyright (c) 2021-2025 tteck
# Author: tteck (tteckster)
# License: MIT | https://github.com/community-scripts/ProxmoxVE/raw/main/LICENSE
# Source: https://ubuntu.com/

APP="Ubuntu-Azure"
var_tags="${var_tags:-azure-devops}"
var_cpu="${var_cpu:-2}"
var_ram="${var_ram:-4096}"
var_disk="${var_disk:-30}"
var_os="${var_os:-ubuntu}"
var_version="${var_version:-24.04}"
var_unprivileged="${var_unprivileged:-1}"
#var_workdir="${var_workdir:-azp}"
#var_user="${var_user:-agent}"

header_info "$APP"
variables
color
catch_errors

function update_script() {
  header_info
  check_container_storage
  check_container_resources
  if [[ ! -d /var ]]; then
    msg_error "No ${APP} Installation Found!"
    exit
  fi
  msg_info "Updating ${APP} LXC"
  $STD apt-get update
  $STD apt-get -y upgrade
  msg_ok "Updated ${APP} LXC"
  msg_ok "Updated successfully!"
  exit
}

start
build_container
description

msg_ok "Completed Successfully!\n"
echo -e "${CREATING}${GN}${APP} setup has been successfully initialized!${CL}"