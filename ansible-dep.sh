echo ''
tput bold
tput setaf 5
echo '[ Flickswitch Web Development Environment ]'
tput setaf 2
echo 'Installing curl'
tput sgr0

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  sudo apt-get install curl
elif [[ "$OSTYPE" == "darwin*" ]]; then
  brew install curl
else
  tput setaf 1
  echo "Your platform isn't supported in this script"
  tput sgr0
  exit 1
fi
BIN_DIR="/usr/bin"
if [ ! -f $BIN_DIR/vagrant ]; then
	tput setaf 3
	echo "Fetching vagrant"
	tput sgr0
	VAGRANT_FILENAME="vagrant_1.6.3_x86_64.deb"
	VAGRANT_URL="https://dl.bintray.com/mitchellh/vagrant/$VAGRANT_FILENAME"
	echo "$VAGRANT_URL"
	curl -L -o $VAGRANT_FILENAME $VAGRANT_URL
	tput setaf 3
	echo "Installing vagrant"
	sudo dpkg -i $VAGRANT_FILENAME
fi
if [ ! -f $BIN_DIR/virtualbox ]; then
	echo "Fetching Virtualbox"
	VIRTUALBOX_FILENAME="virualbox-4.3_4.3.12_amd64.deb"
	VIRTUALBOX_URL="http://download.virtualbox.org/virtualbox/4.3.12/virtualbox-4.3_4.3.12-93733~Ubuntu~raring_amd64.deb"
	echo "$VIRTUALBOX_URL"
	curl -L -o $VIRTUALBOX_FILENAME $VIRTUALBOX_URL
	echo "Installing virtualbox"
	sudo dpkg -i $VIRTUALBOX_FILENAME
fi
tput bold
tput setaf 2
echo '* Install Ansible';
tput sgr0
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  sudo apt-get install ansible
elif [[ "$OSTYPE" == "darwin*" ]]; then
  brew install ansible
else
  tput setaf 1
  echo "Your platform isn't supported in this script"
  tput sgr0
  exit 1
fi
tput setaf 2
tput bold
echo '* Done *'
tput sgr0
echo ''
tput bold
tput setaf 5
echo 'To start your environment, please type `vagrant up`'
tput sgr0
echo ''
