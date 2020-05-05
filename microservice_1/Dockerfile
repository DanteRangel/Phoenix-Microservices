FROM elixir:1.9
# FROM ubuntu:latest
MAINTAINER Dante Rangel <dante.rangelrobles@gmail.com>

# Elixir requires UTF-8
# RUN apt-get update && apt-get upgrade -y && apt-get install locales && locale-gen en_US.UTF-8
# ENV LANG en_US.UTF-8
# ENV LANGUAGE en_US:en
# ENV LC_ALL en_US.UTF-8

# # update and install software
# RUN apt-get install -y curl wget git make sudo
# RUN apt-get install -y gnupg2

#     # download and install Erlang apt repo package
# RUN wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb

# RUN dpkg -i erlang-solutions_2.0_all.deb
# RUN apt-get update
# RUN rm erlang-solutions_2.0_all.deb
#     # install latest elixir package
# RUN apt-get install -y elixir erlang-dev erlang-dialyzer erlang-parsetools
# RUN apt-get install  -y erlang-xmerl
# RUN apt-get install -y erlang-runtime-tools
# # RUN apt-get install -y cat
#     # clean up after ourselves
# RUN apt-get clean

# install the Phoenix Mix archive
RUN mix local.hex --force \
    && mix local.rebar --force
RUN mix archive.install hex phx_new

# install Node.js (>= 8.0.0) and NPM in order to satisfy brunch.io dependencies
# See https://hexdocs.pm/phoenix/installation.html#node-js-5-0-0
# RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && sudo apt-get install -y inotify-tools nodejs

RUN mkdir app
# COPY . /app
WORKDIR /app

# COPY script.sh /app/script.sh
# # RUN chmod +x /app/script.sh
# RUN mix deps.get
# RUN mix deps.compile

EXPOSE 4000

CMD [ "mix", "compile" ]