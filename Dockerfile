FROM  alpine:latest

###----------------------------------------------------------------------------
### Variables
###----------------------------------------------------------------------------
ENV USER 'root'


###----------------------------------------------------------------------------
### OS Maintenance
###----------------------------------------------------------------------------
# Update the apk cache, then upgrade all packages on the system
RUN apk update && apk upgrade


###----------------------------------------------------------------------------
### DEV / Humans
###----------------------------------------------------------------------------
# Add some conveniences
ADD system/bashrc "/$USER/.bashrc"
ADD system/bash_profile "/$USER/.bash_profile"
ADD system/vim-sensible/plugin/sensible.vim "/$USER/.vimrc"

# Add utilities
RUN apk add bash vim coreutils tzdata curl ca-certificates

# Add Dev utilities
RUN apk add bash-completion bash-doc coreutils binutils bind-tools \
    findutils tree vim

# Default SHELL: bash; we're not animals
RUN sed -i "/^$USER/ s/ash/bash/1" /etc/passwd


###----------------------------------------------------------------------------
### Go Home
###----------------------------------------------------------------------------
WORKDIR /root/