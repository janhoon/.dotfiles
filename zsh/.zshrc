export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git aws)

# Download Znap, if it's not there yet.
[[ -f ~/Git/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Git/zsh-snap

source ~/Git/zsh-snap/znap.zsh  # Start Znap

znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

source $ZSH/oh-my-zsh.sh

alias vim=nvim
alias k=kubectl
alias tf=terraform

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin:/$HOME/bin:$HOME/.local/bin
export COLORTERM=truecolor

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U compinit
compinit -i

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -f ~/.env ]; then
    cat ~/.env | while read line; do
        export $line
    done
fi

(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
# Added by Windsurf
export PATH="/Users/janhoon/.codeium/windsurf/bin:$PATH"

# opencode
export PATH=/Users/aho/.opencode/bin:$PATH

echo 'eval "$(~/.local/bin/mise activate zsh)"' >> ~/.zshrc

eval "$(/opt/homebrew/bin/mise activate zsh)"
eval "$(~/.local/bin/mise activate zsh)"
eval "$(~/.local/bin/mise activate zsh)"
eval "$(~/.local/bin/mise activate zsh)"
eval "$(~/.local/bin/mise activate zsh)"
eval "$(~/.local/bin/mise activate zsh)"
eval "$(~/.local/bin/mise activate zsh)"
eval "$(~/.local/bin/mise activate zsh)"
eval "$(~/.local/bin/mise activate zsh)"
eval "$(~/.local/bin/mise activate zsh)"
eval "$(~/.local/bin/mise activate zsh)"
eval "$(~/.local/bin/mise activate zsh)"
eval "$(~/.local/bin/mise activate zsh)"
eval "$(~/.local/bin/mise activate zsh)"
eval "$(~/.local/bin/mise activate zsh)"
eval "$(~/.local/bin/mise activate zsh)"
eval "$(~/.local/bin/mise activate zsh)"
eval "$(~/.local/bin/mise activate zsh)"
eval "$(~/.local/bin/mise activate zsh)"
eval "$(~/.local/bin/mise activate zsh)"
