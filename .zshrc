# --------------------------
# ZSH Configuration - Fixed PATH
# --------------------------

# Oh My Zsh plugins (manual loading)
if [ -f ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666"
    source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# User-local executables
export PATH="$HOME/.local/bin:$HOME/.config/bin:$HOME/go/bin:$PATH"

# Homebrew (works for Apple Silicon & Intel)
if [ -d "/opt/homebrew/bin" ]; then
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
elif [ -d "/usr/local/bin" ]; then
    export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
fi

# Starship prompt
if command -v starship &>/dev/null; then
    eval "$(starship init zsh)"
fi

# History settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt APPEND_HISTORY

# Your usual aliases & configs can go below
# e.g. alias ll="ls -lah"

# Enable history search with up/down arrows
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

export PATH="$PATH:/Applications/Cursor.app/Contents/Resources/app/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init zsh)"

# bun completions
[ -s "/Users/gianlucahenze/.bun/_bun" ] && source "/Users/gianlucahenze/.bun/_bun"
