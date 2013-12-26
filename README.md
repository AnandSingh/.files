 To store my vim and bash related settings

Clone this repository as
```
$ cd ~
$ git clone https://github.com/AnandSingh/.vim ~/.vim
$ ln -s ~/.vim/.vimrc ~/.vimrc
$ ln -s ~/.vim/.bashrc ~/.bashrc
$ git submodule init
$ git submodule update
```
Upgrading all bundled plugins
```
$ git submodule foreach git pull origin master
```


* Install vim-pathogen from "https://github.com/tpope/vim-pathogen"
* Install vim-airline from "https://github.com/bling/vim-airline"
* Install taglist.vim from "https://github.com/bling/taglist.vim"
* Install vim-colors-solarized from "https://github.com/altercation/vim-colors-solarized"
* To use 256-color install ncurses-term, then "echo $TERM" would give
   "xtrem-256color". If using gnome-terminal add following into ~/.bashrc
   script
```
    if["$COLORTERM"=="gnome-terminal"];then
    	export TERM=xterm-256color
    if
```
* To install plugins as submodule
```
$ cd ~/.vim
$ mkdir ~/.vim/bundle
$ git submodule add https://github.com/scroolloose/nerdtree bundle/nerdtree
$ git add .
$ git commit -m "Install nerdtree as submodule "bundle/nerdtree""
```
* To remove plugins
```
$ git config -f .git/config --remove-section submodule.bundle/nerdtree
$ git config -f .gitmodule --remove-section submodule.bundle/nerdtree
$ git rm --cached bundle/nerdtree
$ rm -rf bundle/nerdtree
$ rm -rf .git/modules/bundle/nerdtree
$ git add .gitmodules
$ git commit -m "Removed plugin bundle/nerdtree"
```
