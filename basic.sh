#!/bin/bash
#
# This is a minimal setup script for an Ubuntu Box for Python development
# for students. 

set -x

echo "UPDATING AND UPGRADING PACKAGES"
# Always necessary after installation
apt-get install update
apt-get install upgrade

# Things I want on any machine I use
echo "INSTALLING DEV UTILITIES"
apt-get install gitg tree tmux ack-grep ipython emacs curl

# pip is essential for Python development. 
# Installing flask verifies that pip is working.
echo "INSTALLING PIP & FLASK"
curl -O http://python-distribute.org/distribute_setup.py
python distribute_setup.py
curl -O https://raw.github.com/pypa/pip/master/contrib/get-pip.py
python get-pip.py
pip install flask

# Sorry Firefox, I need Chrome.
echo "INSTALLING CHROME"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update 
sudo apt-get install google-chome-stable

# This is for the 'right-click to open terminal'
echo "INSTALLING NAUTILUS"
sudo apt-get install nautilus-open-terminal
nautilus -q

# So I don't find myself in nano, ever.
echo "SETTING EDITOR TO EMACS"
echo "export EDITOR='emacs -nw'" | sudo tee -a /etc/profile
source /etc/profile
