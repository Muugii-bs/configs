# ZSH INSTALL
sudo apt-get -y update
sudo apt-get -y install zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# GIT & VIM CONFIGS
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
{
  brew install neovim
} || {
  sudo apt-get install software-properties-common
  sudo apt-get install python-software-properties
  sudo add-apt-repository ppa:neovim-ppa/stable
  sudo apt-get update
  sudo apt-get install neovim
  sudo apt-get install python-dev python-pip python3-dev python3-pip
}
pip2 install --upgrade pip
pip3 install --upgrade pip
pip2 install --user --upgrade neovim
pip3 install --user --upgrade neovim
nvim -c :PlugInstall -c :q! -c :q!

git clone https://github.com/Muugii-bs/configs.git
cd configs

# Copy config files
mv gitconfig ~/.gitconfig
git checkout -b vim-full origin/vim-full-config
cd vim-full-config
rm -rf ~/.vim
mv vim ~/.vim
mv vimrc ~/.vimrc

mkdir ~/.config/nvim
mv init.vim ~/.config/nvim/
cp -r ~/.vim/colors ~/.config/nvim/
cd ../../
rm -rf configs
rm -rf .git
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer || sudo apt-get -y install build-essential cmake || sudo apt-get -y install build-essential cmake3 || ./install.py --clang-completer
cd ~/.local/share/nvim/plugged/YouCompleteMe
./install.py --clang-completer || sudo apt-get -y install build-essential cmake || sudo apt-get -y install build-essential cmake3 || ./install.py --clang-completer
