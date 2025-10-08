#!/bin/bash

# Update System
sudo apt update && sudo apt upgrade -y
# Installs curl and gpg
sudo apt install curl gpg -y
# Curl command to get swift
curl -O https://download.swift.org/swiftly/linux/swiftly-$(uname -m).tar.gz && \
tar zxf swiftly-$(uname -m).tar.gz && \
./swiftly init --quiet-shell-followup && \
. "${SWIFTLY_HOME_DIR:-$HOME/.local/share/swiftly}/env.sh" && \
hash -r
# After install script recommend by swift installer after install (On Debian)
sudo apt-get -y install binutils libicu-dev libcurl4-openssl-dev libedit-dev libsqlite3-dev libncurses-dev libpython3-dev libxml2-dev pkg-config uuid-dev git gcc libstdc++-12-dev