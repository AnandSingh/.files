 To store my vim and bash related settings

1. install vim-pathogen from "https://github.com/tpope/vim-pathogen"
2. To use 256-color install ncurses-term, then "echo $TERM" would give
   "xtrem-256color". If using gnome-terminal add following into ~/.bashrc
   script

if["$COLORTERM"=="gnome-terminal"];then
	export TERM=xterm-256color
fi
