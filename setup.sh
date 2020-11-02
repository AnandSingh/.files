#!/usr/bin/env bash

BLACK_COLOR=$(tput setaf 0)
RED_COLOR=$(tput setaf 1)
GREEN_COLOR=$(tput setaf 2)
YELLOW_COLOR=$(tput setaf 3)
BLUE_COLOR=$(tput setaf 4)
MAGENTA_COLOR=$(tput setaf 5)
CYAN_COLOR=$(tput setaf 6)
WHITE_COLOR=$(tput setaf 7)
DEFAULT_COLOR=$(tput sgr 0)


banner()
{
    echo ========================================  
    echo $1
    echo ========================================  
}

declare -a g_groups=(
    dialout
    adm
    systemd-journal
    wheel
)


declare -a g_fedora_repos=(
    https://download.docker.com/linux/fedora/docker-ce.repo
)

declare -a g_packages=(
    dnf-plugins-core
    zsh
    openssh-server
    bmon
    iptraf
    nload
    iftop
    ifstat
    fping
    vim
    iptables-services
    make
    cscope
    ctags
    gdb
    gdb-gdbserver
    xsel
    docker-ce
    docker-ce-cli
    containerd.io
    git
    autoconf
    automake
    libtool
    gnutls
    gnutls-devel
    libgcrypt
    libgcrypt-devel
    libcurl
    libcurl-devel
    systemd
    systemd-devel
    flex
    flex-devel
    bison
    bison-devel
    makedepend
    tmux
    minicom
    the_silver_searcher
)

function do_packages_cmd()
{
    local cmd=$1
    sudo dnf upgrade --refresh -y
    sudo dnf ${cmd} -y "${g_packages[@]}"
}

function install_packages()
{
    banner "Installing packages ... "
    do_packages_cmd "install"
}

function setup_tmux()
{
    # setup TMUX plugin manager TPM 
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "Start Tmux and 'prefix + U' (capital U, as in Update) to fetch tmux plugins"
}

function setup_zsh()
{
  # Install ohmyzsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  cp ~/.files/.oh-my-zsh/custom/themes/aks.zsh-theme ~/.oh-my-zsh/custom/themes/

  # Download zsh-autosuggestions by
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

  # Download zsh-syntax-highlighting by
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
}

function setup_vim()
{
  # update VIM plugin 
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  # Launch vim and run :PluginInstall
  # Or run below command
  vim +PluginInstall +qall
}

function install_env()
{
    banner "Installing environment ..."
    declare -a local add_dotfile=(
        .bashrc
        .bashrc_private
        .gitconfig
        .lightline.tmux.conf
        .tmux.conf
        .vimrc
        .zshrc
        .dir_colors  
    )

    cd ${HOME}
    git clone https://github.com/AnandSingh/.files.git
    
    for i in ${add_dotfile[@]}; do
        cp -rfv .files/${i} ${HOME}
    done

    setup_tmux
    setup_zsh
    setup_vim
}


function add_fedora_repos()
{
    banner "Adding Fedora repos ..."
    for i in ${g_fedora_repos[@]}; do
        set -x
        sudo dnf config-manager --add-repo ${i}
        set +x
    done
}

function docker_group()
{
    # Cgroups Exception: For Fedora 31 and higher, you need to enable the backward compatibility for Cgroups.
    sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
    banner "Creating docker group ..."
    set -x
    sudo groupadd docker
    set +x
    banner "Adding myself, ${USER}, to docker group"
    set -x
    sudo usermod -aG docker ${USER}

    sudo systemctl enable docker
    sudo systemctl start docker
    set +x
}

function add_to_groups()
{
    banner "Adding myself, ${USER}, to groups ..."
    for i in ${g_groups[@]}; do 
        set -x
        sudo usermod -aG ${i} ${USER}
        set +x
    done
}

function system_logout()
{
    local do_again="1"
    while [ ${do_again} == "1" ]; do
        read -p "Need to logout from this machine. Do you want to do this now? [Yes|No]" yn
        do_again="0"
        case $yn in
            [yY]|[yY][eE][sS])
                gnome-session-quit
                ;;
            [nN]|[nN][oO])
                echo -n "${YELLOW_COLOR}Warning: "
                echo -n "For changes to take an effect you will to logout and log back into "
                echo "this machine at a later time ${DEFAULT_COLOR}"
                ;;
            *) echo "Please enter Yes or No"
                do_again="0"
                ;;
        esac
    done
}

function run()
{
    add_fedora_repos
    install_packages
    install_env
    docker_group
    add_to_groups
    system_logout
}

run
