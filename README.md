# step-agent-plugin

The Smallstep agent runs on your devices to securely manage end-to-end certificate lifecycle for all your Managed Workloads. It handles device enrollment and workload certificate management for a broad range of workload types.

This plugin is for users of [Smallstep Certificate Manager](https://smallstep.com/).

## Installation

For install instructions across all platforms, see [Installing the Smallstep Agent](https://smallstep.com/docs/platform/smallstep-app/).

## Linux Installer Script

The [`smallstep-agent-install.sh`](smallstep-agent-install.sh) script automates agent installation on supported Linux distributions. See the [packages.smallstep.com](https://github.com/smallstep/packages.smallstep.com) repo for GCS deployment instructions.

### Testing

Run the test script to validate the installer across all supported distros using Docker:

```bash
bash scripts/test-smallstep-agent-installer.sh
```
