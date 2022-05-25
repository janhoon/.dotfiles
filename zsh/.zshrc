zstyle ':znap:*' repos-dir ~/.znap
source ~/zsh-snap/znap.zsh
export ZSH="/home/janhoon/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions

source $ZSH/oh-my-zsh.sh
# source <(kubectl completion zsh)
eval $(gh completion -s zsh)

alias vim=nvim
alias sleeplock="i3lock && echo mem > /sys/power/state"
alias k=kubectl
alias cona='conda activate ${PWD##*/}'
alias conc='conda create -n ${PWD##*/}'
 
eval $(thefuck --alias)

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin:/$HOME/bin
export COLORTERM=truecolor

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

autoload -U compinit
compinit -i
