#!/usr/bin/env bash

flags='-n'

if [[ "$1" == "--run" ]]; then
    flags=''
fi

rsync -rlcv $flags --delete \
    --exclude='check-update.sh' \
    --exclude='.git*' \
    --exclude='viminfo' \
    --exclude='.tmp/' \
    --exclude='/gvimrc' \
    --exclude='/fix-vimrc.patch' \
    ~/.vim/ \
    ./

if [[ "$1" != "--run" ]]; then
    echo '[DRY-RUN MODE] Run it with --run'
else
    # made by diff -u ~/.vim/vimrc vimrc > fix-vimrc.patch
    patch < fix-vimrc.patch
fi
