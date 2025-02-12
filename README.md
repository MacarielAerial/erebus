# Erebus

Template repository for infrastructure deployment with Infrastructure-as-Code (IaC) tools (e.g. OpenTofu, a variant of Terraform).

This template is based on AWS but Azure's installation script is also available in *./scripts*.

## Code Example

    ```sh
    # Configure a Single-Sign-On profile to retrieve credentials automatically
    aws configure sso

    # Enter start-url, region, output format and profile name accordingly based on AWS Access Portal info
    ```

## Host System Configuration

Remember to configure non-login shell configuration script *~/.bashrc* to include the following for SSH agent forwarding:

    ```sh
    # Start SSH Agent if not already running
    if [ -z "$SSH_AUTH_SOCK" ]; then
    # Check for a currently running instance of the agent
    RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
    if [ "$RUNNING_AGENT" = "0" ]; then
            # Launch a new instance of the agent
            ssh-agent -s &> $HOME/.ssh/ssh-agent
    fi
    eval `cat $HOME/.ssh/ssh-agent` > /dev/null
    fi

    # Necessary for VSCode to forward the ssh agent
    export SSH_AGENT_SOCK=$SSH_AUTH_SOCK
    ```
