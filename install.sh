#!/usr/bin/env bash
# blatently lifted from https://github.com/swaroopch/dotvim

## Check OS

if [[ "$OSTYPE" =~ "darwin" ]]
then
    export OS="mac"
elif [[ "$OSTYPE" == "linux-gnu" ]]
then
    export OS="linux"
else
    echo "Don't know what to do with '$OSTYPE' operating system"
    exit 1
fi

# Git and Curl required
if [[ $(which git) == "" ]]
then
    echo "Install git ( http://git-scm.com ) first"
    exit 1
fi
if [[ $(which curl) == "" ]]
then
    echo "Install curl ( http://curl.haxx.se ) first"
    exit 1
fi

export VIM_BACKUP_DIR="/tmp/dotvim-backup"
mkdir -p $VIM_BACKUP_DIR
echo "Backing up existing vim files to $VIM_BACKUP_DIR"
for f in $(ls -a $VIM_BACKUP_DIR| grep -v '^.$' | grep -v '^..$')
do
    rm -rf "$VIM_BACKUP_DIR/$f"
done
for f in "$HOME/.vimrc" "$HOME/.gvimrc" "$HOME/.vimrc.local" "$HOME/.vim"
do
    [[ -s "$f" ]] && mv -f "$f" $VIM_BACKUP_DIR
done

echo "Ensuring backup directory exists"
mkdir -p "$HOME/.vim/backup"
mkdir -p "$HOME/.vim/tmp"

echo "Download plug.vim"
if [[ ! -d "$HOME/.vim/autoload/plug.vim" ]]
then
    curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Link vimrc, gvimrc"
ln -s -f "$PWD/vimrc" "$HOME/.vimrc"
ln -s -f "$PWD/gvimrc" "$HOME/.gvimrc"
if [[ -f "$PWD/vimrc.local" ]]
then
    ln -s -f "$PWD/vimrc.local" "$HOME/.vimrc.local"
fi

echo "Link theme"
mkdir "$HOME/.vim/colors"
ln -s -f "$PWD/colors/fhwrdh.vim" "$HOME/.vim/colors/fhwrdh.vim"

echo "Link airline theme"
mkdir -p "$HOME/.vim/autoload/airline/themes/"
# symlink no good?
# ln -s -f "$PWD/autoload/airline/themes/fhwrdh.vim" "$HOME/.vim/autoload/airline/themes/fhwrdh.vim"
cp "$PWD/autoload/airline/themes/fhwrdh.vim" "$HOME/.vim/autoload/airline/themes/fhwrdh.vim"

vim +PlugUpgrade +qa || { echo 'Error upgrading Plug. Will continue.'; }
vim +PlugInstall +qa || { echo 'Error installing vim plugins'; return 1; }

echo "Custom snippets"
mkdir -p "$HOME/.vim/UltiSnips"
for f in $(ls UltiSnips/*)
do
    ln -s -f "$PWD/$f" "$HOME/.vim/UltiSnips"
done

echo "Custom ftplugins"
mkdir -p "$HOME/.vim/ftplugin"
for f in $(ls ftplugin/*)
do
    ln -s -f "$PWD/$f" "$HOME/.vim/ftplugin"
done

echo "Custom after plugins"
mkdir -p "$HOME/.vim/after/plugin"
for f in $(ls after/plugin/*)
do
    ln -s -f "$PWD/$f" "$HOME/.vim/after/plugin"
done

echo "Finished"


