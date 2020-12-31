export PATH=$HOME/.local/bin:/usr/local/bin:$PATH

export ZSH="/home/$(whoami)/.oh-my-zsh"
ZSH_THEME="robbyrussell"

COMPLETION_WAITING_DOTS="true"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
DEFAULT_USER=$USER

plugins=(git node autoenv stack z fzf-z zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

prompt_context(){}

bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word
bindkey "^X\x7f" backward-kill-line

source $HOME/.iterm2_shell_integration.zsh

unsetopt share_history
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY
setopt cdable_vars
setopt appendhistory     #Append history to the history file (no overwriting)
setopt sharehistory      #Share history across terminals
setopt incappendhistory  #Immediately append to the history file, not just when a term is killed
HISTFILE=$HOME/.persistent/.zsh_history

alias ls=exa
alias ll="exa -l --git -g --header"
alias cls='echo -n "\\x1b]1337;ClearScrollback\\x7"'
hash -d re=/workspace/restaumatic

[[ $- == *i* ]] && source "/usr/share/doc/fzf/examples/completion.zsh" 2> /dev/null

source "/usr/share/doc/fzf/examples//key-bindings.zsh"
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='-e --border --color dark'
export FZF_ALT_C_COMMAND="fd -t d"
export FZFZ_SUBDIR_LIMIT=0

# expose ssh-agent to other sessions (e.g. launched externally with docker exec)
[[ -z "$SSH_AUTH_SOCK" ]] && source $HOME/.ssh_sock || echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK" > $HOME/.ssh_sock

export ANDROID_HOME=$HOME/.android
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/repo --work-tree=$HOME'

alias overlay="/usr/bin/git --git-dir=/workspace/restaumatic-overlay --work-tree=/workspace/restaumatic"
