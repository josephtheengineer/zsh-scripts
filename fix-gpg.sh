export GPG_TTY=$(tty)
gpgconf –kill gpg-agent
pkill pinentry
pkill gpg-agent
gpg-connect-agent updatestartuptty /bye > /dev/null
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export GPG_TTY=$(tty)
