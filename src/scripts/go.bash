#!/usr/bin/env bash

# go
#
# sets up go environment
# --------

PACKAGES=(
    github.com/golang/lint/golint
)

log -v "setting up go..."

brew_install go
mkdir -p ~/.go
export GOPATH="$HOME/.go"

for p in "${PACKAGES[@]}"; do
    if prompt_user "install $p? (y/n)"; then
        go get "$p"
    fi
done
