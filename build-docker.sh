#!/usr/bin/env bash

set -e

# Generate vim.tar.gz
SRC_DIR='.vim'
VIM_ZIP='vim.tar.gz'
tar zcf "${VIM_ZIP}.tmp" "${SRC_DIR}"
mv -v "${VIM_ZIP}.tmp" "${VIM_ZIP}"

# Build docker
docker build -t agy-sandbox .

# Delete temporary files
rm -v "${VIM_ZIP}"
