#!/bin/bash

if ! command -v curl >/dev/null; then
  sudo apt update
  sudo apt install -y curl
fi

sudo mkdir -pm755 /usr/share/keyrings

curl -fsSL https://raw.githubusercontent.com/fagramdesktop/fagram-deb/main/fagram_repo.asc \
  | sudo gpg --dearmor --yes -o /usr/share/keyrings/fagram-keyring.gpg

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/fagram-keyring.gpg] \
  https://raw.githubusercontent.com/fagramdesktop/fagram-deb/main/apt/repo/ bionic main" \
  | sudo tee /etc/apt/sources.list.d/fagram.list > /dev/null

sudo apt update
sudo apt install -y fagram