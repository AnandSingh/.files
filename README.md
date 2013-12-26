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


1. install vim-pathogen from "https://github.com/tpope/vim-pathogen"
2. To use 256-color install ncurses-term, then "echo $TERM" would give
   "xtrem-256color". If using gnome-terminal add following into ~/.bashrc
   script
``
   <if["$COLORTERM"=="gnome-terminal"];then
	export TERM=xterm-256color
    if>
```
3. Install plugins as submodule
