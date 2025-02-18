# Define environemnt within which IaC tools are executed

#
# Multi Stage: Dev

FROM debian:stable-slim AS dev

# Arguments associated with the non-root user
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    bash \
    sudo \
    wget \
    gpg \
    zip \
    git-lfs \
    shellcheck \
    # To enable IaC tool to access a remote instance
    openssh-server

# Add the non-root user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Copy system dependency installation shell scripts over
COPY scripts/ /tmp/scripts/

# Make them executable
RUN chmod +x /tmp/scripts/*.sh

# Install system dependencies not available in the package manager
RUN /tmp/scripts/install-opentofu.sh
    # Pick the cloud service provider's CLI to install
    # && /tmp/scripts/install-awscli.sh
    # && /tmp/scripts/install-azure-cli.sh

# Switch to the non-root user to install applications on the user level
USER ${USERNAME}