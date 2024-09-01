#!/bin/bash
## Doesn't work!

list=$(find * -type f \( -name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.txt" \) -printf '%p ' )
# echo -e "--list is \n$list\n"

touch "$HOME"/bulk.log
echo ----------------------------- | tee -a "$HOME"/bulk.log
echo -e converting text files "cp1251-->UTF-8\n\t" at $(pwd) on $(date +%Y.%m.%d_%T) | tee -a "$HOME"/bulk.log
# echo --candidat files list-- | tee -a "$HOME"/bulk.log
# echo "$list" | tee -a "$HOME"/bulk.log
# echo --edited files list-- | tee -a "$HOME"/bulk.log

# Создать файл с функцией для Вима
# set fileencodings=ucs-bom,utf-8,default,cp1251,latin1
    # set fileencodings=ucs-bom,utf-8,default,cp1251,latin1
    # edit!
cat << 'EOF' > /tmp/bulk.vim
function! Cpconv()
    let l = expand(&fileencoding)
    !echo 01
    exec '!echo ' . expand(l)
    edit! %
    if &fileencoding == "cp1251"
        !echo 02
        set fileencoding=utf-8
        write
        !echo % | tee -a "$HOME"/bulk.log
        exec '!echo ' . expand('%:p') . " " . expand(l) . " CONVERTED"
    else
        !echo 03
        exec '!echo ' . expand('%:p') . " " . expand(l) . " nochange"
    endif
endfunction
EOF
        # call system('echo \"' . expand("%") . '\" | tee -a bulk.log')

# vim -E -o \
#     -c 'set fileencodings=ucs-bom,utf-8,default,cp1251,latin1' \
#     -c 'source /tmp/bulk.vim' \
#     -c 'bufdo  call Cpconv()' \
#     -c wqa $list

# vim -Es -c 'argdo source /tmp/bulk.vim | call Cpconv()' -c "qa" $list
vim -Es -c "set ff=unix " -c ":wq" $list

echo
echo Updated log at "$HOME/bulk.log"

