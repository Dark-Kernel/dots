
# Download file from media fire.
function mef
    curl -s "$argv[1]" | pup "a#downloadButton attr{href}" | xargs wget 
end

# remove all stopped docker containers
function dcr 
    docker ps -a | awk '{print $1}' | sed -n '1!p' | xargs -I{} docker remove '{}' 
end

# ansible docker env setup 
function ans
    docker restart 64d8d9ea1ab2 324fe6151cd1 66f8cf50c2db 0d227070e15a 
end

# upload file to cloud-shell
function up
    curl -F "filee=@$argv[1]" "https://cloud-shell.onrender.com" 
end

# Rename file and remove spaces
# rs(){ for f in * ; do name=$(echo "$f" | sed 's/ /_/g') && mv "$f" "$name" ; done }

# Music from pagalworld
# playy(){ arg=$(echo "$@" | sed 's/ /+/g'); curl -s 'https://www.pagalworld.com.se/find/${arg}/1.html' | pup '.list li a attr{href}' | while read line; do curl -s "https://www.pagalworld.com.se$line" | pup 'audio attr{src}' | xargs -I{} curl -s "https://www.pagalworld.com.se{}" | pup 'meta attr{content}' | cut -d= -f2 ; done | fzf | xargs -I{} mpv --no-video '{}' }

# Find current file
function o
    nvim $(find . -type f -not -path '*/.*' | fzf --height 50% --preview 'bat --style=numbers --color=always {}' ) 
end

#o(){ nvim $(find . -type f -not -path '*/.*' | fzf --height 40% ) }
#o(){ nvim $(find . -type f | fzf --height 40% ) }

function mean
    curl dict://dict.org/d:"$argv[1]" ; 
end

function short
    curl -s "http://tinyurl.com/api-create.php?url=$argv[1]" && echo " "; 
end


function qr
    notify-send "$(curl -s qrcode.show/$argv[1])"; 
end

function cpfile
    cat $argv[1] | xclip -sel c #wl-copy 
end

function cpbuffer
    printf "%s" "$BUFFER" | xclip -sel c ;  #wl-copy ; 
end

# tor
function tsrc
   /usr/bin/zsh -c "if [[ $argv[1] -eq 1 ]]; then . torsocks on; else . torsocks off; fi "
end
    
