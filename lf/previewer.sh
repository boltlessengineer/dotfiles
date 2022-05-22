#!/bin/sh

# check here : https://www.youtube.com/watch?v=50BMBT05Wk0

# Run the command below to give this file an execution permission
# `chmod +x previewer.sh`

case ${1##*.} in
  7z|zip) 7z l -p -- "$1" && exit 1;;
  jpeg|jpg|png|gif) chafa --clear --animate=off --symbols space -s "$2x$3" "$1" && exit 1;;
  # TODO: add fallback to chafa
  *) bat --style=plain --color=always "$1" || cat "$1" && exit 1;;
esac
