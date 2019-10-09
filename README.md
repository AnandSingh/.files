VIM Setting
============

To store my vim and bash related settings
How to setup 
------
Clone this repository as
```
$ cd ~
$ git clone https://github.com/AnandSingh/.vim ~/vim
$ cp ~/vim/vimrc ~/.vimrc
```

Install vundle 
------
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Install all the vim plugin
------
Open the vim and run :PluginInstall

Below are the list of plugin used and it's sources
------

* Install vim-pathogen from "https://github.com/tpope/vim-pathogen"
* Install vim-airline from "https://github.com/bling/vim-airline"
* Install taglist.vim from "https://github.com/bling/taglist.vim"
* Install vim-colors-solarized from "https://github.com/altercation/vim-colors-solarized"
* Install OmniCppComplete from "https://github.com/vim-scripts/OmniCppComplete"
* Install javacomplete from "https://github.com/vim-scripts/javacomplete"
* Install ctrlp.vim from "https://github.com/kien/ctrlp.vim"
* Install syntastic from "https://github.com/scroolose/syntastic"
* Install supertab from https://github.com/ervandew/supertab.git bundle/supertab
* Install pyflakes-pathogen from https://github.com/mitechie/pyflakes-pathogen.git
* Install ack from https://github.com/mileszs/ack.vim.git bundle/ack
* Install pydoc from https://github.com/fs111/pydoc.vim.git bundle/pydoc
* Install pep8 from https://github.com/vim-scripts/pep8.git bundle/pep8
* Install py.test from https://github.com/alfredodeza/pytest.vim.git 
* Install vim-bracketed-paste from https://github.com/ConradIrwin/vim-bracketed-paste 
* Install YouCompleteMe from https://github.com/Valloric/YouCompleteMe 
* YCM Installation steps
```
    $ cd ~
    $ mkdir ycm_build
    $ cd ycm_build
    $ cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
    $ cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/llvm/ . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp 
    $ make ycm_support_libs
```
* To use 256-color install ncurses-term, then "echo $TERM" would give
   "xtrem-256color". If using gnome-terminal add following into ~/.bashrc
   script
```
    if["$COLORTERM"=="gnome-terminal"];then
    	export TERM=xterm-256color
    if
```

Additional Information
------
* Check "http://vim.wikia.com/wiki/Cscope" for additionl information on CScope

* "http://www.fsl.cs.sunysb.edu/~rick/cscope.html" for tricks on ctags, cscope in VIM.
Extaract from same site =>
Make sure 'set csto=0' is included in your vimrc if you are coding C, and 'set csto=1' is included in your vimrc if you are coding C++ (see 'Theory' section above if you want to know why).
Now you are ready to start using it. Simply type ':cs help' to see the commands right there. Type ':tags' to see where you currently are in the tag stack. Finally ':tag' will take you to an arbitrary symbol (and tab-completion works). Try typing ':tag sys_' and the press the Tab key and you should see it try going through several possible completions.
 Usage:
     Control-\ g to find the definition of a variable, 
     Control-\ s to find its occurrence as a symbol in other code
     Control-\ c to see where the symbol is called from. 
     The command 'q:' allows you to edit the command line history so you can paste large identifier names into a 'cs find g' command (Ctrl-C exits 'q:' mode).
* Check pyhton related vim setting and plugin information at "http://www.sontek.net/blog/2011/05/07/turning_vim_into_a_modern_python_ide.html#id9"
* Check vim with django at "https://code.djangoproject.com/wiki/UsingVimWithDjango"
