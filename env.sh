sudo apt-get -y update
sudo apt-get -y install zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/Muugii-bs/configs.git
cd configs
mv gitconfig ~/.gitconfig
git checkout -b vim-full origin/vim-full-config
cd vim-full-config
rm -rf ~/.vim 
mv vim ~/.vim
mv vimrc ~/.vimrc
cd ../../
rm -rf configs
