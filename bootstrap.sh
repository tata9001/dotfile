# install brew packages
sh brew.sh
# install pip
curl https://bootstrap.pypa.io/get-pip.py | python
mkdir ~/.pip && cp $PWD/python/pip.conf ~/.pip/
mkdir ~/.percol.d && cp $PWD/python/percol.py ~/.percol.d/rc.py
# links
ln -sf $PWD/spacemacs.d/ ~/.spacemacs.d
ln -sf $PWD/SpaceVim.d ~/.SpaceVim.d

ln -sf $PWD/zsh/zshrc ~/.zshrc
ln -sf $PWD/zsh/zlogin ~/.zlogin
ln -sf $PWD/zsh/zpreztorc ~/.zpreztorc

ln -sf $PWD/SpaceVim.d ~/.SpaceVim.d
