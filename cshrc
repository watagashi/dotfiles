# $FreeBSD: src/share/skel/dot.cshrc,v 1.14.10.1.4.1 2010/06/14 02:09:06 kensmith Exp $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
#

alias h		history 25
alias j		jobs -l
alias la	ls -a
alias lf	ls -FA
alias ll	ls -lA

# A righteous umask
umask 22

set path = (/usr/local/sbin /usr/local/bin /sbin /bin /usr/sbin /usr/bin /usr/games $HOME/bin)

setenv	EDITOR	vi
setenv	PAGER	less
setenv	BLOCKSIZE	K

setenv	TZ	JST-09

setenv	TEMP	/var/tmp
setenv	TMP	/var/tmp
setenv	TMPDIR	/var/tmp

setenv	LANG	ja_JP.eucJP

if ( `uname` == FreeBSD && $tty =~ ttyv[0-7] ) then
	setenv	PACKAGEROOT	ftp://ftp.jp.freebsd.org
	setenv	FTP_PASSIVE_MODE	yes

	if ( $tty =~ ttyv[0-7] ) then
		unsetenv LANG
	endif
endif

if ($?prompt) then
	# An interactive shell -- set some stuff up
	set filec
	set history = 100
	set savehist = 100
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		set complete=enhance
		bindkey -v
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
		set prompt="%n@%m:%\!:%c02%# "
	endif
endif
