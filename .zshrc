##key folders
export cloud="$HOME/Library/CloudStorage/OneDrive-Personal"
export Scripts="$HOME/Documents/Scripts"
export Apple_Scripts="$HOME/Documents/Scripts/Apple_Scripts"
export Git="$HOME/Documents/Scripts/Git"
export Go="$HOME/Documents/Scripts/Go"
export HTML="$HOME/Documents/Scripts/HTML"
export Javascript="$HOME/Documents/Scripts/Javascript"
export Project_Ideas="$HOME/Documents/Scripts/Project_Ideas"
export Python="$HOME/Documents/Scripts/Python"
export Bash="$HOME/Documents/Scripts/Bash"
export PHP="$HOME/Documents/Scripts/PHP"
export SQL="$HOME/Documents/Scripts/SQL"
export Powershell="$HOME/Documents/Scripts/Powershell"
export JQuery="$HOME/Documents/Scripts/JQuery"

export Downloads=$HOME/Downloads
export Documents=$HOME/Documents
export GOPATH=$HOME/go

source $HOME/.config/.githubtoken

# Sleep the laptop after 60 minutes, update every 10 seconds
function bedtime(){
for ((i=0; i < 3600; i+=10)); do; 
  if (($i % 10 == 0)); then; 
    t=$(((3600-$i)/60)); 
    echo "Sleeping with $t minutes remaining"; 
  fi; 
  sleep 10;
  done; 
  blueutil -p 0; osascript -e "tell app \"System Events\" to sleep" 
}

# Set what the terminal looks like on each line
#export PS1="%n@%m %1~ %# "
export PS1="%3~ -> "

#Quickly run a server in current folder
alias newserver='"$Bash/Works/new_local_server.sh"'
#start is the same as open
alias start=open
#alias for pypy
alias pypy=pypy3.10

#Autocomplete with out oh-my-zsh
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

#Rename a Tab
func newTitle() {
  if [ $1 ];
  then
    echo $1
    echo -en "\033]1; $1 \007" 
  else
  local pwd="${PWD/#$HOME/~}"
  pwd_list=(${(s:/:)pwd})
  pwd_list=('/' $pwd_list)
  echo $pwd_list[${#pwd_list}]
    echo -en "\033]1; $pwd_list[${#pwd_list}] \007" 
  fi
}

function largeFiles(){
  find . -type f -size +1GB -exec du -h {} \;
}

# Write out the description of the man page
function describe (){
if [ "$1" ]; then
  man $1 | col -b | sed -n '/^DESCRIPTION$/,/^[A-Z ]\{2,\}$/p' | sed '2d;$d' | awk -v RS= -v ORS="\n\n" 'NR<=2'
else
  echo "USAGE: describe [bash function]"
fi
}

#function newGitHub(){
#if [ $1 ];
#then
#git init
#git add -A
#git commit -m 'BATMAN'
#git remote add origin $1
#git push -u -f origin main
#else
#  echo "Please enter a github website address to send this to"
#fi
#}

#List and number all files in a folder
func lsls (){
  ((x=1)); 
  for i in *; do; 
    echo $x $i; ((x=x+1)); 
  done
}

#open all files with a specific word or phrase
func openAll(){
  new_results=$(find $PWD/* -type f -iname "*$1*"); 
  new_array=("${(@f)new_results}"); 
    for i in "${new_array[@]}"; do; 
      open "$i"; 
    done
}

# Show or Hide files in Finder
func hideFiles (){
  defaults write com.apple.finder AppleShowAllFiles false; killall Finder
}

func showFiles (){defaults write com.apple.finder AppleShowAllFiles true; killall Finder}

#Load pyenv
# Generated for envman. Do not edit.
#[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

#export PYENV_ROOT="$HOME/.pyenv"
#[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"
export PATH=$PATH:$HOME/go/bin
export PATH="/opt/homebrew/opt/mysql@8.4/bin:$PATH"
