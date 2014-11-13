#!/bin/bash
#
# This is a setup script for an Ubuntu server for Python deployment
#

set -x

echo "UPDATING AND UPGRADING PACKAGES"
# Always necessary after installation
apt-get update
apt-get upgrade

# Things I want on any machine I use
echo "INSTALLING DEV UTILITIES"
apt-get install tree tmux ack-grep ipython emacs24 curl python-pip sqlite3
ln -s /usr/bin/ack-grep /usr/local/bin/ack 
pip install -U ipython pytest virtualenv

# So I don't find myself in nano, ever.
echo "SETTING EDITOR TO EMACS"
echo "export EDITOR='emacs'" | sudo tee -a ~/.bashrc
# A decent prompt
echo "export PS1='\[\e[1;34m\]\w\[\e[m\]\n\[\e[1;31m\]\u@\h [\t] $\[\e[m\] '" | sudo tee -a ~/.bashrc

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



