#!/bin/zsh

# @package
# @brief
# @author stfate

if [ $# -ne 1 ]; then 
    echo "usage: gen_new_post.sh <postname>" 1>&2
    exit 1
fi

mkdir -p content/blog/$1
cp -r __template/* content/blog/$1
