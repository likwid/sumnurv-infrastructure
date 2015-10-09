FROM msaraiva/elixir-dev

RUN apk --update add zsh vim && \
    rm -rf /var/cache/apk/* && \
    git clone https://github.com/elixir-lang/vim-elixir.git ~/.vim && \
    git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
CMD ["/bin/zsh"]
