#!bin/bash

# Update & Install dependencies
echo -e "\033[0;32mUpdating and Installing dependencies...\033[0m"
sudo apt update && sudo apt upgrade -y
sudo apt -qy install curl git jq lz4 build-essential unzip screen
clear

# Install Nodejs
echo -e "\033[0;32mInstall Nodejs via nvm-list...\033[0m"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm list-remote
echo -e "\033[0;32mSelect your Node.js version: \033[0m" read NODEJS_USER
nvm install $NODEJS_USER

if [ $? -eq 0 ]; then
    clear
    echo -e "\033[0;32mNode.js version $NODEJS_USER installed successfully!\033[0m"
else
    echo -e "\033[0;31mFailed to install Node.js version $NODEJS_USER. Please check the logs above.\033[0m"
fi

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
