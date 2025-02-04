#!/bin/zsh

# @package
# @brief
# @author stfate

# gatsby build
# python ./shell/cp_twitter_cards.py
echo "stfate.net" > ./public/CNAME
gh-pages -d public
