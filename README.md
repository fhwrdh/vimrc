vimrc

### Installation

```
git clone https://github.com/fhwrdh/vimrc.git
cd vimrc
./install.sh
```

### Post install

install coc-extensions

```
vim -c "CocInstall coc-css coc-eslint coc-go coc-gocode coc-highlight coc-html coc-json coc-lists
coc-marketplace coc-python coc-snippets coc-tsserver coc-ultisnips coc-yaml coc-yank"
```

build vim from source on mac

```
git clone https://github.com/vim/vim.git && \
cd vim && \
make clean && \
make distclean && \
./configure \
    --with-features=huge \
    --enable-multibyte \
    --enable-rubyinterp=yes \
    --enable-pythoninterp=yes \
    --with-python-config-dir=/usr/lib/python2.7/config \
    --enable-python3interp=yes \
    --with-python3-config-dir=$(python3-config --configdir) \
    --enable-perlinterp=yes \
    --enable-luainterp=yes \
    --enable-gui=gtk2 \
    --enable-cscope \
    --prefix=/usr/local
```
