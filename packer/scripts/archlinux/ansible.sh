# Install pip 2
pacman -Sy --noconfirm python2-pip

# Install ansible
source ~/.bash_profile
which pip2
/usr/bin/pip2 install -U ansible
