#!/bin/bash
#
# This is a setup script for an Ubuntu server for Python deployment
#
# to create ec2 instance:
# aws ec2 run-instances --image-id ami-d05e75b8 --count 1 --instance-type t2.micro --key-name tm-api --security-groups python-web-server --profile eric
#
set -x

echo "UPDATING AND UPGRADING PACKAGES"
# Always necessary after installation
apt-get update
apt-get upgrade

# Things I want on any machine I use
echo "INSTALLING DEV UTILITIES"
apt-get install tree tmux ack-grep ipython emacs curl sqlite3 python3-pip python-pip
ln -s /usr/bin/ack-grep /usr/local/bin/ack 
pip install -U ipython pytest virtualenv

# Setting up gitconfig
echo "CONFIGURING GIT"
git config --global user.name 'Eric Wilson'
git config --global user.email 'wilson.eric.n@gmail.com'
git config --global alias.di 'diff'
git config --global alias.ci 'commit'
git config --global alias.co 'checkout'
git config --global alias.br 'branch'
git config --global alias.st 'status'
git config --global alias.up 'fetch --all --prune'
git config --global alias.tree "log --graph --decorate --pretty=oneline\n --abbrev-commit"
git config --global alias.all "for-each-ref --format='%(refname:short) <- %(upstream:short)' refs/heads"
git config --global github.user 'ewilson'
git config --global push.default 'simple'
git config --global color.ui 'true'

echo "setting up virtualenvwrapper"
sudo pip install virtualenvwrapper
cat bashrc_extras >> ~/.bashrc

