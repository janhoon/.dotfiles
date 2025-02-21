export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

# Download Znap, if it's not there yet.
[[ -f ~/Git/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Git/zsh-snap

source ~/Git/zsh-snap/znap.zsh  # Start Znap

znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

source $ZSH/oh-my-zsh.sh

alias vim=nvim
alias sleeplock="i3lock && echo mem > /sys/power/state"
alias k=kubectl
alias tf=terraform
alias cona='conda activate ${PWD##*/}'
alias conc='conda create -n ${PWD##*/}'
alias gocov="go test --short -coverprofile=coverage.out -tags=unit ./... && go tool cover -html=coverage.out && rm coverage.out"

eval $(kubectl completion zsh)
eval $(gh completion -s zsh)
 
eval $(thefuck --alias)

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin:/$HOME/bin:$HOME/.local/bin
export COLORTERM=truecolor

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U compinit
compinit -i

# alias dbt=meltano invoke dbt-redshift
# alias dbt="meltano invoke dbt-redshift"
# alias airflow="meltano invoke airflow"
# alias activate-venv=". .venv/bin/activate"
# alias airflow="meltano invoke airflow"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -f ~/.env ]; then
    cat ~/.env | while read line; do
        export $line
    done
fi

alias dbt="meltano invoke dbt-redshift"
