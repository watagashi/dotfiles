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

		path=(/Applications/MacVim.app/Contents/MacOS(N) ~/.config/yarn/global/node_modules/.bin(N) ~/.yarn-config/global/node_modules/.bin(N) /usr/local/bin /usr/bin /bin /usr/sbin /sbin /usr/local/sbin(N) ~/bin(N))
		;;
esac

typeset -U path
