#!/bin/bash
# Sorry, no documentation for this

go_through ()
{
  unset key
  echo
  echo will go through $PWD
  if  ! [[ $( ls -A *.conf 2>/dev/null ) ]] ; then
    echo Theme files not found here!
    exit
  fi
  while (true) ; do
    if [[ $key == 'i' ]] ; then
      if [[ -d favs ]] && [[ $( ls -A favs/*.conf 2>/dev/null ) ]] ; then
        cd favs
      else
        echo --Favs not found! Gonna crawl this list again
        echo
      fi
    fi
    #
    if [[ $key == 'b' ]] ; then
      if [[ $( ls -A ../*.conf 2>/dev/null ) ]] ; then
        cd ..
      else
        echo --Themes not found! Gonna crawl this list again
        echo
      fi
    fi
    #
    echo ------------
    echo Themes are:
    ls -x *.conf
    echo ------------
    echo current theme is $(readlink $HOME/.config/kitty/current-theme.conf)
    echo
    #
    for t in *.conf ; do
      unset key
      echo $t
      kitty @ set-colors -a "$PWD/$t"
      read -rsn 1 key
      [[ $key == 'f' ]] && mkdir -p favs && cp "$t" "favs/$t" && echo --Added to favs.
      [[ $key == 'd' ]] && mkdir -p del && mv "$t" "del/$t" && echo --Moved to trash.
      [[ $key == 'q' ]] && echo --Reverting to $(readlink /ln/co/kitty/current-theme.conf) && kitty @ set-colors -a ~/.config/kitty/current-theme.conf && exit
      [[ $key == 'i' ]] && echo && echo --Entering next level of favourites && break
      [[ $key == 'b' ]] && echo && echo --Entering upper level && break
      [[ $key == 'a' ]] && ln -snrf "$t" ~/.config/kitty/current-theme.conf &&
                         ln -snrf "$t" ~/.config/kitty/"$(nowis)"-theme.conf && echo --Applied!
    done
    echo
  done
}

echo key commands are : f d q a i b
cd ~/.config/kitty-themes/themes/ && go_through

