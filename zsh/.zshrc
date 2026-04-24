# Define zdotdir
export ZDOTDIR="$HOME"

# Autocd
setopt autocd

# More Options
setopt extended_glob #extendedglob is a zsh shell option that enables enhanced filename/glob pattern matching beyond the standard wildcard syntax (*(zero or more ocurrences), !(anythinhg except the pattern),etc)
setopt menucomplete

# Completions 
# insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*' 
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
autoload -Uz compinit && compinit #enables autocompletion
_comp_options+=(globdots) # With hidden files

# History setup
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_SPACE # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS  # Don't save duplicate lines
setopt SHARE_HISTORY      # Share history between sessions

# Evals
eval "$(zoxide init zsh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#Functions
function zsh_add_file(){
  [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

function zsh_add_plugin(){
  PLUGIN_NAME=$(echo $1 | cut -d '/' -f 2)
  if [ -d "$ZDOTDIR/.zsh-plugins/$PLUGIN_NAME" ]; then
    zsh_add_file ".zsh-plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh"
    zsh_add_file ".zsh-plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
  else
    git clone "https://github.com/$1.git" "$ZDOTDIR/.zsh-plugins/$PLUGIN_NAME"
  fi
}

zsh_add_plugin "zsh-users/zsh-completions"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "wfxr/forgit"
zsh_add_plugin "zdharma-continuum/fast-syntax-highlighting"

#Aliases
#Common aliases
alias nv="nvim"
alias nvd="nvim ."
alias nvf="nvim +GoToFile"
alias nvg="nvim +GoToString"
alias tmp='cd /tmp'
alias c="clear"
alias py="python"
alias cdf="zi"
alias bat="bat --theme ansi"
alias cd="z"
alias zshr="source $ZDOTDIR/.zshrc"
alias myip="curl http://ipecho.net/plain; echo"
alias usage='du -h -d1'
alias rm='trash-put'
alias lastmod='find . -type f -not -path "*/\.*" -exec ls -lt {} +'
alias t='exit'
#ohmyzsh
alias cpf="copyfile"
#git
alias g="git"
alias gc="git clone --recurse-submodules"
alias gaa="git add ."
alias gau="git add -u"
alias gp="git push origin HEAD"
alias gpl="git pull"
alias gs="git status"
alias ghopen='open $(git remote get-url origin | sed -E "s#(git@github.com:|https://github.com/)#https://github.com/#; s/\.git$//")'

#docker 
alias stopallcontainers='docker ps -q | xargs docker stop'
#remove unused containers, but keep the volumes
alias pruneallcontainers='docker system prune -a'
#compose aliases
alias dcup='docker compose up'
alias dcdown='docker compose down'
alias dcstop='docker compose stop'
alias lad=lazydocker
alias lag=lazygit

#Arch aliases
alias pacin="sudo pacman -S --needed"
alias pacud="sudo pacman -Syu"
alias pacse="pacman -Ss"
alias pacre="sudo pacman -Rns"
alias pacun="sudo rm /var/lib/pacman/db.lck"
alias paccl='sudo pacman -Rs -- $(pacman -Qtdq)'
alias aurup='yay -Sua'
alias aurin='yay -S'
alias aurse='yay -Ss'
alias aurre='yay -Rns'
alias aurli="pacman -Qm"

#Ubuntu aliases
alias aptin="sudo nala install -y"
alias aptud="sudo nala update"
alias aptug="sudo nala upgrade -y"
alias aptse="nala search"
alias aptre="sudo nala purge"

#Exports
export EDITOR=nvim
export SUDO_EDITOR=nvim
export MANPAGER='nvim +Man!'

#from ThePrimeagen: add a folder to PATH
addToPath() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1
    fi
}
addToPathFront() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

addToPath "$HOME/.local/bin"
addToPath "$HOME/.local/utilities"

# Shell wrapper for Yazi
# We suggest using this y shell wrapper that provides the ability to change the current working directory when exiting Yazi.
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

alias gcm='noglob gcm_real'
gcm_real() {
  git commit -m "$*"
}

# Plugins
# plugins=(
#     copyfile 
#     copybuffer 
#     extract
#     nvm
#     fzf 
# )

#eza aliases
alias ls='eza --icons --classify=auto'
alias l='eza -l --icons --classify=auto'
alias la='eza -la --icons --classify=auto'
alias lla='eza -a --icons --classify=auto'
alias lt='eza --tree --icons --classify=auto'
