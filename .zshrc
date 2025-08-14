DISABLE_AUTO_UPDATE=true

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export PYENV_ROOT=/media/ssd/.pyenv
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export CLANG_ROOT=/media/ssd/clang/clang+llvm-17.0.6-aarch64-linux-gnu
export CMAKE_PREFIX_PATH=$CLANG_ROOT:/media/ssd/qt/qt6:$CMAKE_PREFIX_PATH
export LD_LIBRARY_PATH=$CLANG_ROOT/lib:/media/ssd/qt/qt6/lib:$LD_LIBRARY_PATH
export CXX=$CLANG_ROOT/bin/clang++
export CC=$CLANG_ROOT/bin/clang

export PATH=/usr/local/cuda/bin:/media/ssd/clang/clang+llvm-17.0.6-aarch64-linux-gnu/bin:/media/ssd/cmake/cmake-3.30.2-linux-aarch64/bin:$PATH

alias gs="git status"
alias gd="git diff"

export SKIP_HARDWARE_DECODER=1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

fixssh() {
    if [ -n "$TMUX" ]; then
       eval $(tmux show-environment | sed -n 's/^SSH_\([^=]*\)=\(.*\)/export SSH_\1="\2"/p')
    elif [ -f ~/.ssh-agent-env ]; then
       source ~/.ssh-agent-env
    fi
}

# Try to load existing agent env
if [ -f ~/.ssh-agent-env ]; then
    source ~/.ssh-agent-env
fi

# Check if the agent is actually running
if ! ssh-add -l >/dev/null 2>&1; then
    eval $(ssh-agent -s | grep -v '^echo') > ~/.ssh-agent-env
    source ~/.ssh-agent-env

    if [ -n "$TMUX" ]; then
       tmux set-environment SSH_AUTH_SOCK "$SSH_AUTH_SOCK"
       tmux set-environment SSH_AGENT_PID "$SSH_AGENT_PID"
    fi
fi
