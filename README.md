 To store my vim and bash related settings

clone this repository as
$ cd ~
$ git clone https://github.com/AnandSingh/.vim ~/.vim
$ ln -s ~/.vim/.vimrc ~/.vimrc
$ ln -s ~/.vim/.bashrc ~/.bashrc

1. install vim-pathogen from "https://github.com/tpope/vim-pathogen"
2. To use 256-color install ncurses-term, then "echo $TERM" would give
   "xtrem-256color". If using gnome-terminal add following into ~/.bashrc
   script

    if["$COLORTERM"=="gnome-terminal"];then
	export TERM=xterm-256color
    fi
