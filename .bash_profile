# ~/.bash_profile
#   source ~/dotfiles/.bash_profile
#   test -r ~/.bashrc && . ~/.bashrc

export PATH=/usr/local/bin:$PATH
[[ -e "/usr/local/bin/vimpager" ]] && export PAGER=vimpager
if [ -x "/Applications/MacVim.app/Contents/MacOS/Vim" ]
then
    alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
    alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
    alias view='/Applications/MacVim.app/Contents/MacOS/view'
    alias vimdiff='/Applications/MacVim.app/Contents/MacOS/vimdiff'
    #alias ctags='/Applications/MacVim.app/Contents/MacOS/ctags'
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if `which -s brew` && [ -f $(brew --prefix)/etc/bash_completion ]; then
	echo 1
fi

