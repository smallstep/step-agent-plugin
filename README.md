# step-agent-plugin

The Smallstep agent runs on your devices to securely manage end-to-end certificate lifecycle for all your Managed Workloads. It handles device enrollment and workload certificate management for a broad range of workload types.

This plugin is for users of [Smallstep Certificate Manager](https://smallstep.com/).

## Linux Installer

The [`smallstep-agent-install.sh`](smallstep-agent-install.sh) script installs the Smallstep agent on supported Linux distributions:

- Fedora
- RHEL, CentOS Stream, Rocky Linux, AlmaLinux
- Debian, Ubuntu

### Usage

Download and run:

```bash
curl -fsSL https://raw.githubusercontent.com/smallstep/step-agent-plugin/main/smallstep-agent-install.sh -o smallstep-agent-install.sh
sudo bash smallstep-agent-install.sh --team <your-team>
```

To pin to a specific version, use a commit SHA or tag:

```bash
curl -fsSL https://raw.githubusercontent.com/smallstep/step-agent-plugin/<commit-sha>/smallstep-agent-install.sh -o smallstep-agent-install.sh
sudo bash smallstep-agent-install.sh --team <your-team>
```

### Testing

Run the test script to validate the installer across all supported distros using Docker:

```bash
bash scripts/test-smallstep-agent-installer.sh
```

### GCS Deployment

This script is also deployed to GCS and served at `https://packages.smallstep.com/scripts/smallstep-agent-install.sh`. See the [packages.smallstep.com](https://github.com/smallstep/packages.smallstep.com) repo for upload instructions.
