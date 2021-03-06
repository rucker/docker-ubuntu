FROM ubuntu:latest
ARG user=$USER

# Upgrade, install packages
RUN apt-get update -qq && \
    apt-get upgrade -y
RUN apt-get install -y \
    git-core locales htop sudo tree tzdata vim

# Configure user
RUN useradd $user --create-home -g sudo
RUN passwd -d $user

# Configure system
RUN echo "America/New_York" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN sed -i 's,# en_US.UTF-8 UTF-8,en_US.UTF-8 UTF-8,' /etc/locale.gen
RUN locale-gen
