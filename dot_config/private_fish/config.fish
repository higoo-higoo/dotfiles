if status is-interactive
    # Commands to run in interactive sessions can go here
end

#ghq
bind \c] __ghq_repository_search
set GHQ_SELECTOR peco

#alias
alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -a'
alias rm='trash'

