# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"

# JAVA HOME
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-17.0.13.0.11-3.fc41.x86_64
export PATH=$JAVA_HOME/bin:$PATH

# ANDROID ROOT
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_HOME=$ANDROID_SDK_ROOT
export PATH=$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$PATH
export PATH=$PATH:$ANDROID_HOME/emulator
export ANDROID_NDK=$ANDROID_SDK_ROOT/ndk/28.0.12674087

# Docker shim
if command -v podman &> /dev/null; then
    alias docker="podman"
else
    alias docker="distrobox-host-exec -- podman"
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/invincent/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/invincent/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/invincent/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/invincent/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Added by .NET installer
#export DOTNET_ROOT="/home/invincent/.dotnet"
#export PATH="$DOTNET_ROOT:$PATH"
#
#
export JETBRAINS_CLI_INSTALL="/home/invincent/Downloads/JetBrains.ReSharper.CommandLineTools.2025.1.4"
export PATH="$JETBRAINS_CLI_INSTALL:$PATH"
export BROWSER=brave-browser

eval "$(thefuck --alias)"

export EDITOR="nvim"
export VISUAL="nvim"

