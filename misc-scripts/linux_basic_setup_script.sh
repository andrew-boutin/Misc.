#!/bin/bash
# Execute this script as root,
if [ "$EUID" -ne 0 ]; then
  echo "Execute script as root."
  exit
fi

echo "Starting basic Linux system setup."

echo "Updating and installing basic apps."
apt-get update && apt-get upgrade
echo "Using Python3 as language of choice."
apt-get install python3-pip
echo "Real programmers use VIM."
pip install vim

# Set up virtualenv environments
virtualenv --version 2>&1 >/dev/null
VIRTUALENVS_INSTALLED = $?

if [ $VIRTUALENVS_INSTALLED -ne 0 ]; then
  echo "Setting up virtual environments."
  pip install virtualenv virtualenvwrapper
  echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> ~/.bashrc
  echo "export WORKON_HOME=~/Env" >> ~/.bashrc
  echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
  source ~/.bashrc
  echo "Create a new virtualenv w/ 'mkvirtualenv <virtualenvname>'.
  echo "Activate a virtualenv w/ 'workon <virtualenvname>'.
else
  echo "VIRTUALENVS already installed. Skipping setup."
fi

# Set up GIT
git --version 2>&1 >/dev/null
GIT_INSTALLED = $?

if [ $GIT_INSTALLED -ne 0 ]; then 
    echo "Setting up GIT."
    pip install git
    echo "Input git user name: "
    read git_user_name
    git config --global user.name git_user_name
    echo "Input git user email: "
    read git_user_email
    git config --global user.email git_user_email
else
  echo "GIT is already installed. Skipping setup."
fi

# Set up SSH keys.
# TODO: Check if file exists first (who am i)
echo "Creating SSH keys."
ssh-keygen -t rsa
echo "Printing SSH public key for easy copying (add to GitHub, etc.)."
cat ~/.ssh/id_rsa.pub
