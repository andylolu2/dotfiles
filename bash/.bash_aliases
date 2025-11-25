# utils
alias ll='ls -lahF'
alias la='ls -lAhF'
alias mkdir='mkdir -pv'

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~='cd ~'

# grep
type grep >/dev/null 2>&1 && \
    alias grep='grep --color=auto'

# find/read files
alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias h='head'
alias t='tail'

# nvim
type nvim >/dev/null 2>&1 && \
    alias vim='nvim'

# tree
type tree &> /dev/null && \
    alias tree='tree -C' && \
    alias treel='tree -C -L'

# git
type git >/dev/null 2>&1 && \
    alias g='git' && \
    alias gst='git status' && \
    alias ga='git add' && \
    alias gc='git commit' && \
    alias gca='git commit --amend --no-edit' && \
    alias gp='git push' && \
    alias gpl='git pull' && \
    alias gpf='git push -f' && \
    alias gcl='git clone --recurse-submodules'
    alias gd='git diff' && \
    alias gds='git diff --staged' && \
    alias gco='git checkout' && \
    alias gcb='git checkout -b'

# tmux
type tmux >/dev/null 2>&1 && \
    alias ta='tmux attach -d -t' && \
    alias td='tmux detach' && \
    alias tn='tmux new -A -D -s' && \
    alias tl='tmux ls' && \
    alias tkill='tmux kill-server' && \
    alias tdel='tmux kill-session -t' && \
    alias fixssh='eval $(tmux showenv -s SSH_AUTH_SOCK)'

# slurm
type squeue >/dev/null 2>&1 && \
    alias sq='squeue' && \
    alias sqm='squeue --format="%.15i %.9P %.45j %.8u %.8T %.10M %.9l %.6D %R %q" --me'

function node_attach() {
  # Attach to first allocated node
  ssh $(squeue --me --json | jq -r .jobs[0].nodes)
}

function container_attach() {
  # Attach to first container running on this machine
  enroot exec -- $(enroot list -f | tail -n 1 |  awk '{print $2}') /bin/bash
}

function remote_container_attach() {
  # Attach to first container running on first allocated node
  ssh -t $(squeue --me --json | jq -r .jobs[0].nodes) 'enroot exec -- $(enroot list -f | tail -n 1 |  awk '\''{print $2}'\'') /bin/bash'
}

