# If not running interactively, don't do anything
[[ $- != *i* ]] && return

echo "Running .zshrc"

fpath=(/usr/local/share/zsh/completions $fpath)

# Setup vi style keybindings
bindkey -v
export KEYTIMEOUT=1
# # Change cursor style for different vi modes
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] ||
#      [[ $1 = 'block' ]]; then
#     echo -ne '\e[1 q'
#   elif [[ ${KEYMAP} == main ]] ||
#        [[ ${KEYMAP} == viins ]] ||
#        [[ ${KEYMAP} == '' ]] ||
#        [[ $1 = 'beam' ]]; then
#     echo -ne '\e[5 q'
#   fi
# }
# zle -N zle-keymap-select
# zle-line-init() {
#   zle -K viins  # initiate 'vi insert' as keymap
#   echo -ne '\e[5 q'
# }
# zle -N zle-line-init
# # Use beam style cursor on startup
# echo -ne '\e[5 q'
# # Use beam style cursor for each new prompt
# preexec() { echo -ne '\e[5 q' ;}

autoload -U colors && colors
# Set prompt
autoload -Uz promptinit
#prompt adam1
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
setopt PROMPT_SUBST
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %F{green}$(parse_git_branch)%b > '

# Set autocomplete stuff
autoload -Uz compinit
# zstyle ':completion:*' completer _complete _ignored _correct _approximate
# zstyle ':completion:*' expand prefix
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' list-suffixes true
# zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select
#zstyle ':completion:*' preserve-prefix '//[^/]##/'
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
# zstyle ':completion::complete:*' gain-privileges 1  # Complete privileged commands
zstyle :compinstall filename '$HOME/.config/zsh/.zshrc'
zmodload zsh/complist
compinit
_comp_options+=(globdots)
setopt COMPLETE_ALIASES  # Complete switches for aliases

# Remove duplicates from $PATH
typeset -U PATH path

# Setup history
if [ ! -d "$XDG_CACHE_HOME/zsh" ]; then
  mkdir -p "$XDG_CACHE_HOME/zsh"
fi
export HISTFILE=$XDG_CACHE_HOME/zsh/history
HISTSIZE=100000000
SAVEHIST=100000000
setopt EXTENDED_HISTORY  # Save timestamps with commands
#setopt SHARE_HISTORY  # Share history between all sessions
setopt APPEND_HISTORY  # Don't overwrite history file
setopt HIST_IGNORE_DUPS  # Don't record an entry that was just recorded
setopt HIST_IGNORE_SPACE  # Don't record an entry starting with a space
setopt HIST_FIND_NO_DUPS  # Ignore duplicates when searching
setopt HIST_REDUCE_BLANKS  # Remove blank lines from history

# Make the prompt smarter
setopt autocd
setopt correct  # Correct typos
setopt correct_all  # Correct typos

# Get aliases
alias ls='ls --color=auto'
SHRC=$XDG_CONFIG_HOME/zsh/.zshrc
ALIASES_FILE=$XDG_CONFIG_HOME/aliases
[ -f "$ALIASES_FILE" ] && source "$ALIASES_FILE"

# bindkeys
# Use vim keys in autocomplete mode
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
# Backspace stops working when going to insert mode from normal mode. Fix this.
bindkey -v '^?' backward-delete-char
# Change behavior of up and down arrow keys to search partial commands
bindkey "^[[A" up-line-or-search
bindkey "^[[B" down-line-or-search
# Edit command in vim
autoload edit-command-line
zle -N edit-command-line
bindkey '^v' edit-command-line

# Load syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
# Suggest aliases for commands
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh
