#!/bin/bash
# Упаковка в архив командой pk 7z /что/мы/пакуем имя_файла.7z

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: pk.sh \"packer\" \"filename\""
  exit 1
fi

infl="$2"
outfl="$2"

if [[ $PK_ADDTS == 1 ]]; then
  outfl="$outfl-"$(date +%Y-%m%d-%H%M%S)
fi

if [ $1 ]; then
  case $1 in
    tbz)     tar cjvf "$outfl".tar.bz2  "$infl" ;;
    tgz)     tar czvf "$outfl".tar.gz  "$infl" ;;
    tar)     tar cpvf "$outfl".tar  "$infl" ;;
    bz2)     bzip "$infl" ;;
    gz)      gzip -c -9 -n "$infl" > "$outfl".gz ;;
    zip)     zip -r "$outfl".zip "$infl" ;;
    7z)      7z a "$outfl".7z "$infl" ;;
    zst)     tar -I 'zstd -10v -T0' -cf  "$outfl".tar.zst "$infl";;
    zst-exc) tar -I 'zstd -10v -T0' -X $sh/zip_exclu -cf "$outfl".tar.zst "$infl";;
    *)       echo "'$1' не может быть упакован с помощью pk()" ;;
  esac
else
  echo "'$1' not allowed"
fi

