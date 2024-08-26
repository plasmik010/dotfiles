#!/bin/bash
# Упаковка в архив командой pk 7z /что/мы/пакуем имя_файла.7z

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: pk.sh \"packer\" \"filename\""
  exit 1
fi

if [ $1 ]; then
  case $1 in
    tbz)     tar cjvf $2.tar.bz2  $2 ;;
    tgz)     tar czvf $2.tar.gz  $2 ;;
    tar)     tar cpvf $2.tar  $2 ;;
    bz2)     bzip $2 ;;
    gz)      gzip -c -9 -n $2 > $2.gz ;;
    zip)     zip -r $2.zip $2 ;;
    7z)      7z a $2.7z $2 ;;
    *)       echo "'$1' не может быть упакован с помощью pk()" ;;
  esac
else
  echo "'$1' not allowed"
fi

