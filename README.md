# Erebus

Template repository for infrastructure deployment with Infrastructure-as-Code (IaC) tools (e.g. OpenTofu, a variant of Terraform).

This template is based on AWS but Azure's installation script is also available in *./scripts*.

## Code Example

    ```sh
    # Configure a Single-Sign-On profile to retrieve credentials automatically
    aws configure sso

    # Enter start-url, region, output format and profile name accordingly based on AWS Access Portal info
    ```
