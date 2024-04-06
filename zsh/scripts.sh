#!/bin/zsh
compress() {
    tar cvzf $1.tar.gz $1
}
killport() {
  kill -9 $(lsof -t -i :$1)
}
