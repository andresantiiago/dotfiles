# p10k
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.dotfiles/alias/.p10k.zsh ]] || source ~/.dotfiles/alias/.p10k.zsh

# Set up Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# export paths
export PATH="$PATH:$HOME/.local/bin:/root/.local/bin:/snap/bin"

# exports dotfiles
[[ ! -f ~/.dotfiles/alias/alias ]] || source ~/.dotfiles/alias/alias
[[ ! -f ~/.dotfiles/alias/work ]] || source ~/.dotfiles/alias/work
[[ ! -f ~/.dotfiles/alias/zoxide ]] || source ~/.dotfiles/alias/zoxide