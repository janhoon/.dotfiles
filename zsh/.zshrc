export ZSH="/Users/jan.hoon/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

# Download Znap, if it's not there yet.
[[ -f ~/Git/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Git/zsh-snap

source ~/Git/zsh-snap/znap.zsh  # Start Znap

znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

source $ZSH/oh-my-zsh.sh

alias vim=nvim
alias sleeplock="i3lock && echo mem > /sys/power/state"
alias k=kubectl
alias cona='conda activate ${PWD##*/}'
alias conc='conda create -n ${PWD##*/}'

eval $(kubectl completion zsh)
eval $(gh completion -s zsh)
 
eval $(thefuck --alias)

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin:/$HOME/bin
export COLORTERM=truecolor

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/janhoon/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/janhoon/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/janhoon/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/janhoon/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

autoload -U compinit
compinit -i

# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
source /Users/jan.hoon/.gvm/scripts/gvm

