.PHONY: push pull install

UNAME_S := $(shell uname -s)
OS = `echo $(UNAME_S) | tr A-Z a-z`
VIMRC = ".vimrc"
FTPLUGIN = "ftplugin"
TEMPLATE = "template"
INSTALL = "install.sh"
DIR_VIMRC = "${HOME}"
DIR_VIM = "${HOME}/.vim"

push:
	cp ${DIR_VIMRC}/${VIMRC} ${OS}/
	cp -r ${DIR_VIM}/${FTPLUGIN} ./
	cp -r ${DIR_VIM}/${TEMPLATE} ./
	git add -A
	git commit -m "sync"
	git push origin master

pull:
	git pull git@github.com:jxunix/utility.git
	cp ${OS}/${VIMRC} ${DIR_VIMRC}
	cp -r ${FTPLUGIN} ${DIR_VIM}/
	cp -r ${TEMPLATE} ${DIR_VIM}/

install:
	sudo sh ./${OS}/${INSTALL}
