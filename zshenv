case $(uname) in
	(FreeBSD)
		path=(/usr/local/sbin /usr/local/bin /sbin /bin /usr/sbin /usr/bin /usr/games $HOME/bin)
		export PACKAGEROOT=ftp://ftp.jp.freebsd.org
		export FTP_PASSIVE_MODE=yes

		if [[ $tty =~ ttyv[0-7] ]]; then
			export LANG=
		fi
		;;
	(Darwin)
		export LANG=ja_JP.utf-8

		path=(/Applications/MacVim.app/Contents/MacOS(N) ~/.config/yarn/global/node_modules/.bin(N) ~/.yarn-config/global/node_modules/.bin(N) /usr/local/opt/gettext/bin(N) /usr/local/bin /usr/bin /bin /usr/sbin /sbin /usr/local/sbin(N) ~/bin(N))
		;;
esac

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

typeset -U path
setopt no_global_rcs
