export LOCAL_ETC="${HOME}/etc"
export LOCAL_LIB="${HOME}/var/lib"
export LOCAL_CACHE="${HOME}/var/cache"
export LOCAL_LOG="${HOME}/var/log"

export ETC="${LOCAL_ETC}"
export LIB="${LOCAL_LIB}"
export CACHE="${LOCAL_CACHE}"
export LOG="${LOCAL_LOG}"

export DESKTOP="${HOME}/desktop"
export DOWNLOADS="${HOME}/downloads"
export WORKSPACE="${HOME}/workspace"

# XDG compatibility
export XDG_CACHE_HOME="${LOCAL_CACHE}"
export XDG_CONFIG_HOME="${LOCAL_ETC}"
export XDG_DATA_HOME="${LOCAL_LIB}"
export XDG_STATE_HOME="${LOCAL_LOG}"
export XDG_RUNTIME_DIR="${LOCAL_CACHE}/run"
export XDG_LIB_HOME="${LOCAL_LIB}"
export XDG_LOG_HOME="${LOCAL_LOG}"

export EDITOR="nvim"

# XDG user dir compatibility
export XDG_DESKTOP_DIR="${DESKTOP}"
export XDG_DOCUMENTS_DIR="${DESKTOP}"
export XDG_DOWNLOAD_DIR="${DOWNLOADS}"
export XDG_MUSIC_DIR="${DESKTOP}"
export XDG_PICTURES_DIR="${DESKTOP}"
export XDG_PUBLICSHARE_DIR="srv"
export XDG_TEMPLATES_DIR="${LIB}/templates"
export XDG_VIDEOS_DIR="${DESKTOP}"

# Fix various applications to respect XDG
export GNUPGHOME="${LOCAL_LIB}/gnupg"
export GIMP2_DIRECTORY="${LOCAL_LIB}/gimp"
export GTK2_RC_FILES="${LOCAL_ETC}/gtk-2.0/gtkrc-2.0"
export GTK_RC_FILES="${LOCAL_ETC}/gtk-1.0/gtkrc"
export NPM_CONFIG_USERCONFIG="${LOCAL_ETC}/npm/npmrc"
export PASSWORD_STORE_DIR="${LOCAL_LIB}/pass"
export PGPPATH="${LOCAL_LIB}/gnupg"
export RANDFILE="${LOCAL_CACHE}/rnd"
export #TASKDATA="${LOCAL_LIB}/task"
export #TASKRC="${LOCAL_ETC}/task/taskrc"
export TMUX_TMPDIR="${LOCAL_CACHE}"
export VIMINIT="source \$LOCAL_ETC/nvim/init.vim"
export ZDOTDIR="${LOCAL_ETC}/zsh"
export LESSHISTFILE="${LOCAL_LIB}/less/history"
export NETHACKOPTIONS="${LOCAL_ETC}/nethack/nethackrc"
export PYTHONSTARTUP="${LOCAL_LIB}/python/startup.py"
export PULSE_SOURCE="${LOCAL_ETC}/pulse/client.conf"
export PULSE_COOKIE="${LOCAL_CACHE}/pulse/cookie"


# Other session-wide variables
export SSH_AUTH_SOCK="${LOCAL_CACHE}/ssh-agent/@{PAM_USER}-socket"
