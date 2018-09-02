# PATH
export PATH=$HOME/bin:/usr/local/bin:/Users/rui/miniconda3/bin:/Developer/NVIDIA/CUDA-9.2/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# CUDA libraries
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-9.2/lib${DYLD_LIBRARY_PATH:+:${DYLD_LIBRARY_PATH}}
export LD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-9.2/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
  tmux
  git
  history
  brew
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration
ZSH_TMUX_AUTOSTART=false
export FZF_DEFAULT_COMMAND='rg --hidden --ignore .git -g ""'

# Preferred editor
export EDITOR='vim'

# Custom aliases
alias python=python3
alias vi=vim

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
