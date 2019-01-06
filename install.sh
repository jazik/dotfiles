#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


grep -q "fastestmirror=1" /etc/dnf/dnf.conf
if [ ! $? -eq 0 ]; then
	sudo sh -c 'echo -e "fastestmirror=1" >> /etc/dnf/dnf.conf'
fi
sudo dnf update -y
sudo dnf install -y vim zsh tmux util-linux-user fzf


if [ -d ~/.vim/bundle/Vundle.vim ]; then
    git -C ~/.vim/bundle/Vundle.vim pull
else
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
cp $DIR/.vimrc ~/.
vim +PluginInstall +qall


if [ ! -d ~/.oh-my-zsh ]; then
    wget http://install.ohmyz.sh -O - | sh
fi
sed -i -e 's/^# export PATH/export PATH/' ~/.zshrc


cp $DIR/.tmux.conf ~/. 
#cp $DIR/.zshrc ~/.


if [ -d ~/.oh-my-zsh/custom/themes/powerlevel9k ]; then
    git -C ~/.oh-my-zsh/custom/themes/powerlevel9k pull
else
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
    cat $DIR/.zshrc.add >> ~/.zshrc
fi
sed -i -e 's/^ZSH_THEME.*/ZSH_THEME="powerlevel9k\/powerlevel9k"/' ~/.zshrc


# https://docs.fedoraproject.org/en-US/quick-docs/adding-new-fonts-fedora/
mkdir -p ~/.fonts
mkdir -p ~/.local/share/fonts/powerline
mkdir -p ~/.config/fontconfig/conf.d


# https://powerline.readthedocs.io/en/latest/installation/linux.html#fonts-installation
if [ ! -f ~/.local/share/fonts/powerline/PowerlineSymbols.otf ]; then
    wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
    wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
    mv PowerlineSymbols.otf ~/.local/share/fonts/powerline/.
    fc-cache -v
    mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
fi


chsh -s /usr/bin/zsh

