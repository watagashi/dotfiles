alias h='history 25'
alias j='jobs -l'
alias la='ls -aF'
alias lf='ls -FA'
alias ll='ls -lAF'

umask 22

export EDITOR=vi
if [[ -r /usr/local/bin/vim ]]; then
	export EDITOR=vim\ -X
elif [[ -r /Applications/MacVim.app/Contents/MacOS/Vim ]]; then
	# export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim\ -X
	export EDITOR=vim\ -X
fi

export PAGER=less
export BLOCKSIZE=K

case $term in
	(ansi)
		export TERM=vt100
		;;
	(cygwin)
		export LANG=ja_JP.SJIS
		;;
esac

export TZ=JST-09

export TEMP=/var/tmp
export TMP=$TEMP
export TMPDIR=$TEMP

if [[ `uname` == FreeBSD ]]; then
	path=(/usr/local/sbin /usr/local/bin /sbin /bin /usr/sbin /usr/bin /usr/games $HOME/bin)
	export PACKAGEROOT=ftp://ftp.jp.freebsd.org
	export FTP_PASSIVE_MODE=yes

	if [[ $tty =~ ttyv[0-7] ]]; then
		export LANG=
	fi
elif [[ `uname` == Darwin ]]; then
	# export LANG=ja_JP.utf-8

	path=(/Applications/MacVim.app/Contents/MacOS(N) /usr/local/bin /usr/bin /bin /usr/sbin /sbin)
	typeset -U path

	if [[ -x /Applications/MacVim.app/Contents/MacOS/Vim ]]; then
		alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
		alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
		alias view='/Applications/MacVim.app/Contents/MacOS/view'
		alias vimdiff='/Applications/MacVim.app/Contents/MacOS/vimdiff'
	fi
fi

if [[ -x ~/vimpager/vimpager ]]; then
	export PAGER=~/vimpager/vimpager
	alias less=$PAGER
elif [[ -x /usr/local/bin/vimpager ]]; then
	export PAGER=vimpager
	alias less=$PAGER
fi

PROMPT="%n@%m:%~ %# "

HISTSIZE=1000
HISTFILE=~/.zhistory
SAVEHIST=1000

# $EDITOR に vi を含むなら bindkey -v が有効になる。
# bindkey -v
bindkey "^N" down-line-or-history
bindkey "^P" up-line-or-history

# http://gihyo.jp/dev/serial/01/zsh-book/0002
setopt auto_cd auto_remove_slash auto_name_dirs
setopt extended_history hist_ignore_dups hist_ignore_space prompt_subst
setopt extended_glob list_types no_beep always_last_prompt
setopt cdable_vars sh_word_split auto_param_keys pushd_ignore_dups
#setopt auto_menu  correct rm_star_silent sun_keyboard_hack
#setopt share_history inc_append_history

autoload -U compinit && compinit

# http://gihyo.jp/dev/serial/01/zsh-book/0005
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}' 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'
# http://www.zsh.org/mla/users/2006/msg00390.html
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} m:[-._]=[-._] r:|[-./_]=** r:|=*' '+l:|=*'

