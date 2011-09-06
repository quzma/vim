#Notes

Everything is handled through vundle, so just vimrc here.


#Installation

clone the repo to ~/.vim

inside the ~/.vim folder:

git submodule init

git submodule update

ln -s ~/.vim/.vimrc ~/.vimrc

vim

:BundleInstall

Restart vim... and presto!

#Pro tip
* snipMate keymapping need to be changed in ~/.vim/bundle/snipmate.vim/after/plugin/snipMate.vim if it bothers you that it interferes with the FoolishTab() backup
* Rubydebug original mappings can also be a PITA, you also need to change them in the plugin directly

#Todo
* make script to automate pro tips