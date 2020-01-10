FROM ubuntu:19.10
MAINTAINER Dane Harrigan <dane.harrigan@gmail.com>

ARG PROJECTS
ARG GO_VERSION
ARG RUBY_VERSION
ARG USER_ID
ARG GROUP_ID
ARG RBENV_ROOT=/usr/local/var/rbenv
ARG USER_DIR=/home/dev

ENV TERM=xterm-256color
ENV SHELL=/usr/bin/zsh
ENV GOPATH=$PROJECTS

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
      curl git-core neovim tmux zsh wget openssh-server openssh-client nodejs \
      autoconf bison build-essential libssl-dev libyaml-dev zlib1g-dev \
      libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev \
      libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev && \
    apt-get clean

RUN curl -s https://dl.google.com/go/go$GO_VERSION.linux-amd64.tar.gz | tar zxv -C /usr/local

RUN git clone https://github.com/rbenv/rbenv.git /usr/local/rbenv
RUN mkdir -p $RBENV_ROOT/plugins && \
    git clone https://github.com/rbenv/ruby-build.git $RBENV_ROOT/plugins/ruby-build
RUN /usr/local/rbenv/bin/rbenv install $RUBY_VERSION && \
    /usr/local/rbenv/bin/rbenv global $RUBY_VERSION

RUN groupadd -g $GROUP_ID -o dev
RUN useradd -m -u $USER_ID -g dev -o -s /usr/bin/zsh dev

RUN ln -s $PROJECTS/src/github.com/daneharrigan/dotfiles/config $USER_DIR/.config && \
    ln -s $PROJECTS/src/github.com/daneharrigan/dotfiles/gemrc /$USER_DIR.gemrc && \
    ln -s $PROJECTS/src/github.com/daneharrigan/dotfiles/gitconfig $USER_DIR/.gitconfig && \
    ln -s $PROJECTS/src/github.com/daneharrigan/dotfiles/tmux.conf $USER_DIR/.tmux.conf && \
    ln -s $PROJECTS/src/github.com/daneharrigan/dotfiles/zshrc $USER_DIR/.zshrc
