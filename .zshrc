# Created by newuser for 5.0.0

PROMPT="%F{cyan}%n%f@%F{green}%M%f[%~] %D %*
%# "

#alias
alias cp='cp -r'
alias rm='rm -r'
alias ls='ls --color'

export LANG=en_US.UTF-8

#complete

#git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

#save history
HISTFILE=$HOME/.zsh_history
HISTSEIZE=1000
SAVEHIST=1000

typeset -A key

key[home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
PATH="$(brew --prefix)/opt/findutils/libexec/gnubin:$PATH"
PATH="$(brew --prefix)/opt/binutils/libexec/gnubin:$PATH"
PATH="$(brew --prefix)/opt/moreutils/libexec/gnubin:$PATH"
PATH="$(brew --prefix)/opt/diffutils/libexec/gnubin:$PATH"

MANPATH="$(brew --prefix)/opt/coreutils/libexec/gnuman:$MANPATH"
MANPATH="$(brew --prefix)/opt/findutils/libexec/gnuman:$MANPATH"
MANPATH="$(brew --prefix)/opt/binutils/libexec/gnuman:$MANPATH"
MANPATH="$(brew --prefix)/opt/moreutils/libexec/gnuman:$MANPATH"
MANPATH="$(brew --prefix)/opt/diffutils/libexec/gnuman:$MANPATH"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/kouya/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/kouya/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/kouya/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/kouya/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

autoload -Uz compinit
compinit
