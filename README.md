# aliases for dev workstations, containers and vms

```
#general
alias aedit='nano $HOME/.aliases';      #edit aliases
alias aupd='source $HOME/.aliases';      #update/source aliases
alias zupd='source $HOME/.zshrc';        #update/source .zsh settings
alias c='clear';     
alias e="echo";      
alias n='nano';
alias la='printf "\n";ls -a; printf "\n"';  #list all files in a directory including hidden files
alias h='cd $HOME';      # shortcut to home directory
alias b='cd ..';        # move back one directory (move one level closer to root directory)
alias f="cd -";        # move forward one directory (move to last directory)
alias l='less --header 1';      # show terminal output on one screen with the header row always shown as you page through content)
alias ports='sudo netstat -tulpn';   # list the ports in use on your workstation
alias s='sudo';
alias cfg='cd ~/.config';      # shortcut to config directory
alias lo='cd $HOME/.local';      # shortcut to local directory
alias hd='cd $HOME/Desktop';      # shortcut to desktop 
alias shortcut='sudo ln -s $(pwd) "$HOME/Desktop"';      # create a desktop shortcut to the directory you are currently in 
alias copywd='printf "$(pwd)" | xclip -sel clip';  #copy current working directory to clipboard (requires xclip)
alias mkcd='_mkcd(){ mkdir "$1"; cd "$1";}; _mkcd'; #create directory and step into it      
alias largest-dirs="sudo du -scmh /* 2> >(grep -v 'cannot access') | sort -g";
alias paths='echo $PATH | tr ":" "\n" ';
alias allgroups='cat /etc/group | sort -g | less';
alias taskmgr='ps aux | less --header 1';
alias zq="cat $HOME/.zhistory | grep -i"; #query zsh command history
alias rm='sudo rm -r';
alias sc='sudo systemctl';
alias scs='sudo systemctl start';
alias sct='sudo systemctl stop';
alias scu='sudo systemctl status';
alias scr='sudo systemctl restart';
alias goog='_search(){ xdg-open "https://www.google.com/search?q=$1" > /dev/null &}; _search'; #open browser and google something
alias newscript='_newscript(){ scriptname="$1";echo -e "#\!/bin/bash\necho \"new\"" > ./$scriptname; chmod +x $scriptname; }; _newscript'; #new ready to execute bash script
alias p='xsel --clipboard --output | pv -qL 500;';  #paste 
alias todo='nano todo.list'; #open existing or create new todo list
alias r='cd /';
alias rr='cd /; sudo -i'; #navigate to root directory as root
alias services='systemctl --type=service --state=running'; #list running services

#detailed directory info with icons (requires exa)
alias xl='printf "\nServer Name: "; cat /proc/sys/kernel/hostname; \
  lsb_release -ris ; \
  printf "User: ";whoami; \
  printf "Directory: ";pwd; \
  exa -a --group-directories-first --icons; printf "\n";';

#github
alias g='git clone ';
alias gd='cd "$(\ls -1dt ./*/ | head -n 1)"; rm .git; rm .gitignore;'; # delete .github folder after cloning
alias github-login='gh auth login ';

#docker
alias d='docker ';
alias de='docker exec -it ';
alias ddr='sudo systemctl daemon-reload'; #reload docker daemon
alias dl='docker ps -a'; #list all containers
alias dstop='echo "docker stop $(docker ps -aq)"'; #stop all containers
alias drmac='echo "docker rm $(docker ps -aq)"'; #remove all containers
alias dsr="docker stop $(docker ps -a -q);docker rm $(docker ps -a -q);";
alias drmai="docker rmi $(docker images -a -q)"; #remove all images

#arch
alias pac='sudo pacman -S --noconfirm ';
alias pacu='sudo pacman -Syu';
alias pacr='sudo pacman -R ';
alias pacsearch='_pacsearch(){ sudo pacman -Ss "$1" -q | sort -g | less --header 1;}; _pacsearch';
alias yaysearch='_yaysearch(){ yay -Ss "$1" -q | sort -g | less }; _yaysearch'; #aur search
alias yay!='yay -S --noconfirm '; #install AUR package
alias yayu='yay -Syu --noconfirm'; #update AUR packages
alias pacyes='yay -Syu --noconfirm; sudo pacman -Syu --noconfirm'; #update pacman and AUR

#rust
alias cb="cargo build";
alias cr='cargo run';
alias cr1="RUST_BACKTRACE=1 cargo run";

#.net
alias .d='dotnet';
alias .b='dotnet build';
alias .r='dotnet run';
alias .w='dotnet watch';
alias .c='dotnet clean';
alias Install-Package='dotnet add package';  #simulate nuget on windows
alias .p='dotnet add package ';

#python
alias python='python3';
alias pip='pip3';
alias py='python3';

#javascript
alias webapp="npx live-server"; //launch a dev web server
alias nr='npm run dev';
alias ni='pnpm install';  #global npm install
#start a dev web app in the background (requires npm live-server)
alias dev="cd /path/to/web/app; npx live-server --port=<port> > /dev/null &;cd -;";

#nginx
alias ng='cd /etc/nginx';
alias ngweb='cd /var/www/html';
alias ngstart='systemctl start nginx';
alias ngstop='systemctl stop nginx';
alias ngstatus='systemctl status nginx';
alias ngtest='nginx -t';
alias ngreload='sudo systemctl reload nginx'
```




