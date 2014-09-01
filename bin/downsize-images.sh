#!/usr/local/bin/zsh

# mkdir gray orange > /dev/null 2>&1

DIMENSIONS="1600x1200"

mogrify -resize $DIMENSIONS "www/images/*.jpg"
mogrify -resize $DIMENSIONS "www/images/gallery/*.jpg"
mogrify -resize $DIMENSIONS "www/images/slider/*.jpg"
