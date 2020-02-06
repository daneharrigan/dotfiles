FROM ubuntu:19.10
MAINTAINER Dane Harrigan <dane.harrigan@gmail.com>

ARG PROJECTS
ARG GO_VERSION
ARG RUBY_VERSION
ARG USER_ID
ARG GROUP_ID
ARG RBENV_ROOT=/usr/local/var/rbenv
ARG USER_DIR=/home/dev
ARG DOTFILES=$USER_DIR/.dotfiles
ARG PRIVATE=$USER_DIR/.private

ENV TERM=xterm-256color

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

ENV SHELL=/usr/bin/zsh
ENV PROJECTS=$PROJECTS

RUN ln -s $DOTFILES/config $USER_DIR/.config && \
    ln -s $DOTFILES/gemrc /$USER_DIR.gemrc && \
    ln -s $DOTFILES/gitconfig $USER_DIR/.gitconfig && \
    ln -s $DOTFILES/tmux.conf $USER_DIR/.tmux.conf && \
    ln -s $DOTFILES/zshrc $USER_DIR/.zshrc && \
    ln -s $PRIVATE/netrc $USER_DIR/.netrc

RUN apt-get update -y && \
    apt install -y apt-transport-https ca-certificates gnupg-agent software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu disco stable" && \
    apt update -y && \
    apt install -y docker-ce mysql
