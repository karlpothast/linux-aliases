
# basic aliases for containers 

alias aedit='nano $HOME/.aliases';  
alias aupd='source $HOME/.aliases';  
alias c='clear';  
alias b='cd ..';  
alias f='cd -';  
alias h='cd $HOME';  
alias la='printf "\n";ls -a; printf "\n"';  
alias ll='printf "\nHost Name: "; cat /proc/sys/kernel/hostname; \  
   printf "Directory: ";pwd; \  
   ls -a; printf "\n";';  
alias g='git clone ';  
alias ch='chmod 777 -R ./';  
alias osinfo='cat /etc/os-release'; #get os info

> within the container

```
docker exec -it <container-name> sh  
cd $HOME  
wget "https://raw.githubusercontent.com/karlpothast/my-linux-aliases/master/container/.aliases"
source $HOME/.aliases  
```

