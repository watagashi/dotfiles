# vim:ft=tcsh:
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

if ( -r /usr/local/bin/vim ) then
	setenv	EDITOR	vim\ -X
else
	setenv	EDITOR	vi
endif
setenv	PAGER	less
setenv	BLOCKSIZE	K
if ( $term == ansi )	setenv	TERM	vt100

setenv	TZ	JST-09

setenv	TEMP	/var/tmp
setenv	TMP	/var/tmp
setenv	TMPDIR	/var/tmp

setenv	LANG	ja_JP.eucJP

if ( `uname` == FreeBSD ) then
	set path = (/usr/local/sbin /usr/local/bin /sbin /bin /usr/sbin /usr/bin /usr/games $HOME/bin)
	setenv	PACKAGEROOT	ftp://ftp.jp.freebsd.org
	setenv	FTP_PASSIVE_MODE	yes

	if ( $tty =~ ttyv[0-7] ) then
		unsetenv LANG
	endif
else if ( `uname` == SunOS ) then
	set path=($home/bin /usr/local/bin /usr/xpg4/bin \
		/usr/bin . /usr/ucb /usr/sfw/bin /usr/openwin/bin /usr/dt/bin)
	setenv MANPATH /usr/local/share/man:/usr/sfw/share/man:/usr/share/man:/usr/openwin/share/man:/usr/dt/man:/usr/local/man
	if ( $?LD_LIBRARY_PATH ) then
		setenv  LD_LIBRARY_PATH /usr/local/lib:$LD_LIBRARY_PATH
	else
		setenv  LD_LIBRARY_PATH /usr/local/lib
	endif
	unsetenv PAGER
endif
if ( -x ~/vimpager/vimpager ) then
	setenv	PAGER	~/vimpager/vimpager
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

		setenv hgcompletion \
			mercurial/contrib/tcsh_completion
		if ( -r /usr/local/share/$hgcompletion ) then
			source /usr/local/share/$hgcompletion
		else if ( -r /usr/local/doc/$hgcompletion ) then
			source /usr/local/doc/$hgcompletion
		endif
		unsetenv hgcompletion
	endif
endif
