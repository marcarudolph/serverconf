#!/bin/bash
sudo ln -s /usr/serverconf/contnet /usr/bin/contnet
sudo yum install bridge-utils
chcon -Rt svirt_sandbox_file_t /var/log
chcon -Rt svirt_sandbox_file_t /usr/serverconf