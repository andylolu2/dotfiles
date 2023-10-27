# My .dotfiles for Fish shell

## Dependencies

- `curl`
- `ripgrep`
- `git`
- `fish`
- `tmux`
- `nvim`

## Installation

```bash
git clone https://github.com/andylolu2/dotfiles ~/.dotfiles && \
 ~/.dotfiles/main.fish
```

## Example usage with Docker

```dockerfile
FROM ghcr.io/pytorch/pytorch-nightly:2.2.0.dev20230930-runtime

ARG USERNAME=dockeruser
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y software-properties-common && \
    add-apt-repository ppa:git-core/ppa && \
    apt-add-repository ppa:fish-shell/release-3 && \
    apt-add-repository ppa:neovim-ppa/unstable && \
    apt update && \
    apt install -y \
        build-essential \
        curl \
        fish \
        git \
        neovim \
        ripgrep \
        sudo \
        tar \
        tmux \
        wget

# (Optional) Install just
# RUN curl https://just.systems/install.sh | bash -s -- --to /usr/local/bin

# (Optional) Intall python packages
# ADD requirements.txt /tmp/requirements.txt
# RUN pip install -U -r /tmp/requirements.txt

# Create the user, set default shell to fish
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME -s /usr/bin/fish \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME

# Setup dotfiles
ADD https://api.github.com/repos/andylolu2/dotfiles/git/refs/heads/main /tmp/version.json
RUN git clone https://github.com/andylolu2/dotfiles $HOME/.dotfiles && \
    $HOME/.dotfiles/main.fish
```

