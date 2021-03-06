#!/bin/bash

dnf update -y

# adobe flash player
rpm -ivh http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux

# dropbox
cat << EOF > /etc/yum.repos.d/dropbox.repo
[dropbox]
name=Dropbox Repository
baseurl=http://linux.dropbox.com/fedora/\$releasever/
gpgkey=http://linux.dropbox.com/fedora/rpm-public-key.asc
EOF

# google chrome
cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=Google Chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF

dnf install cmake -y
dnf install ctags -y
dnf install flash-plugin -y
dnf install google-chrome-stable -y
dnf install java-1.8.0-openjdk-devel -y
dnf install nautilus-dropbox -y
dnf install opencv -y
dnf install opencv-core -y
dnf install opencv-devel -y
dnf install opencv-devel-docs -y
dnf install opencv-python -y
dnf install python-devel -y
dnf install R -y
dnf install rstudio -y
dnf install texlive-collection-* -y
dnf install unar -y
dnf install vim -y
dnf install wqy-microhei-fonts -y

dnf update -y

ssh-keygen -t rsa -C "xnirvana508@gmail.com"
# copy ssh key to github.com
vim ~/.ssh/id_rsa.pub
ssh -T git@github.com

if [ ! -d "~/.vim" ]; then
	mkdir ~/.vim
fi
cp -r ftplugin ~/.vim
cp -r template ~/.vim

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/Valloric/YouCompleteMe ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer
