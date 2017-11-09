sed -i "s/\/\/archive/\/\/br\.archive/g" /etc/apt/sources.list
apt-get update
apt-get dist-upgrade -y
apt-get -y install curl build-essential git tig vim john nmap libpq-dev libpcap-dev gnupg fortune 
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -L https://get.rvm.io | bash -s stable


#"source ~/.rvm/scripts/rvm && cd /vagrant && rvm --install .ruby-version",
#"source ~/.rvm/scripts/rvm && cd /vagrant && gem install bundler",
#"source ~/.rvm/scripts/rvm && cd /vagrant && bundle",
  
