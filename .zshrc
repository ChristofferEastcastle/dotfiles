# Set the GPG_TTY to be the same as the TTY, either via the env var
# or via the tty command.
if [ -n "$TTY" ]; then
  export GPG_TTY=$(tty)
else
  export GPG_TTY="$TTY"
fi



export PATH="/usr/local/bin:/usr/bin:$PATH"


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


autoload -Uz compinit && compinit

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light ohmyzsh/ohmyzsh
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::azure
zinit snippet OMZP::rust
zinit snippet OMZP::command-not-found
zinit snippet OMZP::fzf

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


setopt auto_cd


alias sudo='sudo '
export LD_LIBRARY_PATH=/usr/local/lib



# P10k customizations
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh


export NVM_DIR="$HOME/.nvm"
export NVM_SOURCE="$HOME/.nvm"
[ -s "$NVM_SOURCE/nvm.sh" ] && . "$NVM_SOURCE/nvm.sh"

bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search

# add Pulumi to the PATH
export PATH=$PATH:/home/chris/.pulumi/bin
# add Rider to the PATH
PATH=$PATH:/home/$USER/.local/share/JetBrains/Toolbox/apps/rider/bin

_fix_cursor() {
   echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)

zle_highlight=('paste:none')

# Aliases
alias pjson='python -m json.tool'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

