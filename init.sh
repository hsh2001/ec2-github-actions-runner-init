# Install Docker & NodeJS(with npm) for PM2
sudo apt-get update &&
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release nodejs npm &&

( curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg ) &&

( echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null ) &&
  
sudo apt-get update &&
sudo apt-get install -y docker-ce docker-ce-cli containerd.io &&
apt-cache madison docker-ce &&

( curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash ) &&

( export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" ) &&

nvm install 14.17.5 && nvm use 14.17.5 && npm i -g npm && npm i -g pm2 && pm2
