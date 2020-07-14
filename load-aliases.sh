# You may also like to assign a key to this command:
#
#     bind '"\C-o":"lfcd\C-m"'  # bash
#     bindkey -s '^o' 'lfcd\n'  # zsh
#

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

cd-ls()
{
        cd $1 && ls -a
}

git-sync()
{
        git add .
        git commit -m "$1"
        git push
}

install-font()
{
        cp -r $1 $LOCAL_LIB/fonts/
        ls $LOCAL_LIB/fonts
}

set-wallpaper()
{
        sway output eDP-1 bg $1 fill
}

record()
{
	wf-recorder -f /mnt/data/acts-of-the-engineer/$(date +'%Y')/$(date +'%Y-%m-%d_%H:%M:%S').mkv --audio=2
}

help()
{
        echo '=== MAINTENANCE ==='
        echo ' network'
        echo ' update'
        echo ' config'
        echo ' rebuild'
        echo '=== FILESYSTEM ==='
        echo ' file-manager'
        echo ' ls'
        echo ' cd'
        echo ' rm'
        echo ' cp'
        echo ' mv'
        echo ' editor'
        echo '=== ADMIN ==='
        echo ' task-manager'
        echo ' system-monitor'
        echo '=== ENTERTAINMENT ==='
        echo ' discord'
        echo ' web-browser'
        echo '=== MISC ==='
        echo ' refresh'
        echo ' clear'
}

paperless-server()
{
	paperless runserver &
	paperless document_consumer
}

function rsyncmv
{
	rsync --partial --progress --append --rsh=ssh -r -h --remove-sent-files "$@" && rm -rf $1
}

function cp-progress
{
	cp "$@" & progress -mp $!
}

function mv-progress
{
	mv "$@" & progress -mp $!
}

function yt-dl-best
{
	youtube-dl -F ${@: -1};

	youtube-dl \
	--format "(bestvideo[vcodec=vp9.2]/bestvideo[vcodec=vp9][fps>30]/bestvideo[vcodec=vp9][height>=1080]/bestvideo[fps>30]/bestvideo[height>720])+(bestaudio[acodec=opus]/bestaudio)/best" \
	--write-info-json \
	--write-thumbnail \
	\
	--continue \
	--ignore-errors \
	\
	--write-sub \
	--sub-lang en \
	--write-auto-sub \
	\
	--prefer-free-formats \
	--recode-video webm \
	--convert-subs vtt $@ \
	\
	--restrict-filenames \
	--output '%(playlist_index)s_%(title)s/%(title)s-%(id)s.%(ext)s'
}

# scripts
for file in /etc/zsh/*
do
	filename=$(basename $file .sh)
	alias $filename="/etc/zsh/run-script.sh $filename"
done

# projects workspace
for file in ~/workspace/*
do
	filename=$(basename $file)
	alias $filename="source ~/.config/scripts/open-project.sh $filename"
done

# projects workspace
for file in $PLAN9/bin/*
do
	alias $file="$PLAN9/bin/$filename"
done
