alias ls='ls --color=auto -h'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -lA'
alias l='ls -l'

# python env management
alias pip='pip --require-virtualenv'
alias pip-install-cache='pip install -f ~/Cache/pip/'
alias pip-download-cache='\pip download -d ~/Cache/pip/' # use not aliased pip

venv-activate() {
    local dir="$PWD"
    while [[ "$dir" != "/" ]]; do
        if [[ -f "$dir/.venv/bin/activate" ]]; then
            # shellcheck disable=SC1091
            source "$dir/.venv/bin/activate"
            echo "Activated: $dir/.venv"
            return 0
        fi
        dir="$(dirname "$dir")"
    done
    echo "venv-activate: no .venv found in $PWD or parent directories" >&2
    return 1
}
