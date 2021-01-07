# exit
bak="$HOME/bak/"
bak2="/ln/bl/bak"
mkdir -p $bak
rdir="$PWD"

a=$( ls -t $bak | grep my_bak_ | head -1 )
i=$( echo ${a##my_bak_} | cut -c 1-2 )
! [[ $a ]] && i=11
i=$((i%30))
((i++))

name=$( echo my_bak_"$i"_`date +%Y-%m-%d`.tar.gz )
cd "/ln/ho/dotfiles"
tar -czf "$bak"/"$name" \
  config sh \
  -C / ln \
  -C /ln/ho tt
cp "$bak"/"$name" /ln/bl/bak/conf.tar.gz

[ -d /ln/co/transmission-daemon ] && cd /ln/co/ && tar -czf "$bak"/trm.tar.gz transmission-daemon

[ -d "$bak2" ] &&
  cp -f "$bak"/"$name" "$bak2"/my_bak.tar.gz &&
  cp -f "$bak"/trm.tar.gz /ln/torrents/torrents-bak/

cd "$rdir"

