#!bin/bash

# Update & Install dependencies
echo -e "\033[0;32mUpdating and Installing dependencies...\033[0m"
sudo apt update && sudo apt upgrade -y
sudo apt -qy install curl git jq lz4 build-essential unzip screen
clear

# Install Nodejs
echo -e "\033[0;32mInstall Nodejs via nvm-list...\033[0m"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.bashrc
nvm list-remote

echo -e "\033[0;32mSelect your Nodejs version : \033[0m" NODEJS_USER
nvm use $NODEJS_USER
clear

# Clone github repository
echo -e "\033[0;32mClone github repository...\033[0m"
git clone https://github.com/ryzwan29/rome-testnet.git
cd rome-testnet

# Give executable permission to bash script
echo -e "\033[0;32mGive executable permission to script file...\033[0;32m"
chmod +x auto-deploy-smartcontract.sh

# Install requirements for javascript file
echo -e "\033[0;32mInstall requirements for javascript file...\033[0;32m"
npm install axios
