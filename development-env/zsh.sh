sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.2.1/zsh-in-docker.sh)" -- \
    -t robbyrussell \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -a 'HISTSIZE=500000' \
    -a 'SAVEHIST=500000' \
    -a 'HISTFILE=/root/.zsh_history' \
    -a 'setopt appendhistory' \
    -a 'setopt INC_APPEND_HISTORY' \
    -a 'setopt SHARE_HISTORY' \
    -a 'ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=0"'
chsh -s $(which zsh)
zsh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
