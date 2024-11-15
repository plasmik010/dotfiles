#!/bin/bash
# Упаковка в архив командой pk 7z /что/мы/пакуем имя_файла.7z

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: pk.sh \"packer\" \"filename\""
  exit 1
fi

# inpfile="$2"
# realpath --relative-to=. "$inpfile"
inpfile="$(basename ${2})"
outfile="$inpfile"
outfile_mask="$outfile"

if [[ $PK_ADDTS == 1 ]]; then
  outfile="$outfile-"$(date +%Y-%m%d-%H%M%S)
  outfile_mask="$outfile"
fi

echo "Gonna pack $inpfile --> $outfile.$1"

if [ $1 ]; then
  case $1 in
    tbz)     tar cjvf "$outfile".tar.bz2  "$inpfile" ;;
    tgz)     tar czvf "$outfile".tar.gz  "$inpfile" ;;
    tar)     tar cpvf "$outfile".tar  "$inpfile" ;;
    bz2)     bzip "$inpfile" ;;
    gz)      gzip -c -9 -n "$inpfile" > "$outfile".gz ;;
    zip)     zip -r "$outfile".zip "$inpfile" ;;
    7z)      7z a "$outfile".7z "$inpfile" ;;
    zst)     tar -I 'zstd -10v -T0' -cf  "$outfile".tar.zst "$inpfile" ;;
    zst-exc)  tar -I 'zstd -10v -T0' -X $sh/zip_exclu -cf "$outfile".tar.zst "$inpfile" ;;
    *)       echo "$0 dunno how to pack '$1'"; exit 1 ;;
  esac
else
  echo "'$1' not allowed"
fi

# ls -ldath "$inpfile".*
[[ $? -eq 0 ]] && du -sh "$inpfile" && ls -sath1 "$outfile_mask"*

