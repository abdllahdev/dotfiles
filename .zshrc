#-----------
# ZSH
#-----------

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# ZSH Settings
CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"

zstyle ':omz:update' mode auto      # update automatically without asking

# ZSH Plugins
plugins=(git
         poetry
         zsh-autosuggestions
         zsh-syntax-highlighting
         colored-man-pages)

# Download Znap, if it's not there yet.
[[ -r ~/Repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
source ~/Repos/znap/znap.zsh

# Install autocomplete plugin
znap source marlonrichert/zsh-autocomplete

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# -------------
# Aliases
# -------------

# exa aliases
if [ -x "$(command -v eza)" ]; then
    alias ls="eza"
    alias la="eza --long --all --group --icons --git"
    alias ll="eza --long --group --icons --git"
    alias llt="eza -2 --icons --tree --git-ignore"
fi

# zoxide aliases
if [ -x "$(command -v zi)" ]; then
    alias cd="zi"
fi

# search alias
alias search="fzf --preview 'bat --color=always --style=numbers --line-range=:499 {}' | xargs lvim"

# -------------
# NVM
# -------------

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# -------------
# PNPM
# -------------
export PNPM_HOME="/Users/abdllahdev/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# -------------
# Update Path
# -------------
export PATH="$PATH:/Users/abdllahdev/.local/bin"
