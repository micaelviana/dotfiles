# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

setopt SHARE_HISTORY      # Share history between sessions

# Evals
eval "$(zoxide init zsh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#Aliases
#Common aliases
alias old="cd /home/micael/dotfiles/dontstow/oldconfig/neovim-with-coc/.config/nvim"
alias nv="nvim"
alias nvd="nvim ."
alias nvf="nvim +GoToFile"
alias tmp='cd /tmp'
alias c="clear"
alias py="python"
alias cdf="zi"
alias cd="z"
alias zshr="exec zsh -l"
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

#Arch aliases
alias pacin="sudo pacman -S --needed"
alias pacud="sudo pacman -Syu"
alias pacse="pacman -Ss"
alias pacre="sudo pacman -Rns"
alias pacun="sudo rm /var/lib/pacman/db.lck"
alias paccl='sudo pacman -Rs "$(pacman -Qtdq)"'
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

# Shell wrapper
# We suggest using this y shell wrapper that provides the ability to change the current working directory when exiting Yazi.
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Plugins
plugins=(
    copyfile 
    copybuffer 
    extract
    forgit
    nvm
    fzf 
    fast-syntax-highlighting
    zsh-autosuggestions 
)

#Sources oh-my-zsh config file
source $ZSH/oh-my-zsh.sh

#lsd aliases
alias ls='lsd'
alias l='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias lt='lsd --tree'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
