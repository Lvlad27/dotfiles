ln -sf "$HOME/dotfiles/zsh/aliases" "$HOME/.config/zsh/aliases"
autoload -Uz compinit; compinit

# Autocomplete hidden files
_comp_options+=(globdots)
source ~/dotfiles/zsh/external/completion.zsh

# +---------+
# | ALIASES |
# +---------+

source "$XDG_CONFIG_HOME/zsh/aliases"

fpath=($ZDOTDIR/external $fpath)

autoload -Uz prompt_purification_setup; prompt_purification_setup

bindkey -v
export KEYTIMEOUT=1

autoload -Uz cursor_mode && cursor_mode

# vim mapping for completion, using hjkl to navigate the autocompletion menu
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# configure Zsh to use Neovim (or any editor running in a terminal) to directly edit what you type at the command-line prompt
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# source z
source $HOME/dotfiles/zsh/external/zsh-z.plugin.zsh

# source scripts
source $DOTFILES/zsh/scripts.sh

# verify that the command “fzf” exists, and if it does, it sources fzf completion for Zsh and creates some key bindings you can use in the shell
if [ $(command -v "fzf") ]; then
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
fi

if [ "$(tty)" = "/dev/tty1" ];
then
pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi

# source zsh syntax highlighting (keep at bottom !)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
