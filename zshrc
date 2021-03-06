alias h='history 25'
alias j='jobs -l'
alias la='ls -aF'
alias lf='ls -FA'
alias ll='ls -lAF'

umask 22

export EDITOR=vi
if [[ -r /usr/local/bin/vim ]]; then
	export EDITOR=vim
elif [[ -r /Applications/MacVim.app/Contents/MacOS/Vim ]]; then
	# export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim\ -X
	export EDITOR=vim
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

case $(uname) in
	(Darwin)
		VIM=/Applications/MacVim.app/Contents/Resources/vim
		if ! [[ -x /usr/local/bin/mvim ]] && [[ -x $VIM/../../MacOS/Vim ]]; then
			alias vim="$VIM/../../MacOS/Vim"
			alias gvim="$VIM/../../MacOS/Vim -g"
			alias view="$VIM/../../MacOS/vim -R"
			alias vimdiff="$VIM/../MacOS/vimdiff"
		fi
		unset VIM
		;;
esac

if [[ -x ~/.vim/plugged/vimpager/vimpager ]]; then
	export PAGER=~/.vim/plugged/vimpager/vimpager
	alias less=$PAGER
elif [[ -x /usr/local/bin/vimpager ]]; then
	export PAGER=vimpager
	alias less=$PAGER
fi

if [[ -r /usr/local/opt/zsh-git-prompt/zshrc.sh ]]; then
	source "/usr/local/opt/zsh-git-prompt/zshrc.sh"
	PROMPT='%n@%m:%~$(git_super_status) %# '
else
	PROMPT='%n@%m:%~ %# '
fi

HISTSIZE=1000
HISTFILE=~/.zhistory
SAVEHIST=1000

# $EDITOR に vi を含むなら bindkey -v が有効になる。
bindkey -v
bindkey "^N" down-line-or-history
bindkey "^P" up-line-or-history

# http://gihyo.jp/dev/serial/01/zsh-book/0002
setopt auto_cd auto_remove_slash auto_name_dirs
setopt extended_history hist_ignore_dups hist_ignore_space prompt_subst
setopt extended_glob list_types no_beep always_last_prompt
setopt cdable_vars sh_word_split auto_param_keys pushd_ignore_dups
#setopt auto_menu  correct rm_star_silent sun_keyboard_hack
#setopt share_history inc_append_history

if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

	autoload -Uz compinit
	compinit
fi

# http://gihyo.jp/dev/serial/01/zsh-book/0005
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}' 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'
# http://www.zsh.org/mla/users/2006/msg00390.html
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} m:[-._]=[-._] r:|[-./_]=** r:|=*' '+l:|=*'

for f in 'zsh-autosuggestions' 'zsh-syntax-highlighting'; do
	p="/usr/local/share/${f}/${f}.zsh"
	[[ -f ${p} ]] && source ${p}
done
unset f p
