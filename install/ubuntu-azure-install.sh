#!/usr/bin/env bash

# Copyright (c) 2021-2025 tteck
# Author: HenryHST
# License: MIT | https://github.com/community-scripts/ProxmoxVE/raw/main/LICENSE
# Source: https://ubuntu.com/

source /dev/stdin <<<"$FUNCTIONS_FILE_PATH"
color
verb_ip6
catch_errors
setting_up_container
network_check
update_os

msg_info "Installing Dependencies"
$STD apt install -y git wget
msg_ok "Installed Dependencies"

# Install Azure DevOps Agent
# Version: 4.261.0
msg_info "Install Azure Devops Agent"
$STD  mkdir myagent && cd myagent
$STD wget https://download.agent.dev.azure.com/agent/4.261.0/vsts-agent-linux-x64-4.261.0.tar.gz
$STD tar zxvf vsts-agent-linux-x64-4.261.0.tar.gz

motd_ssh
customize

msg_info "Cleaning up"
$STD apt-get -y autoremove
$STD apt-get -y autoclean
msg_ok "Cleaned"