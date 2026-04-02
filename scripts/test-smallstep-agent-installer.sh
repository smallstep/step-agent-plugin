#!/usr/bin/env bash

set -e

DISTRO_CONTAINER_LIST=(fedora:latest redhat/ubi9:latest quay.io/centos/centos:stream9 almalinux:latest rockylinux/rockylinux:9.3.20231119 debian:latest ubuntu:latest gentoo/stage3:systemd)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

TEST_REPORT=()

for DISTRO in "${DISTRO_CONTAINER_LIST[@]}"; do
  DISTRO_NICKNAME="${DISTRO%%:*}"
  DISTRO_NICKNAME="${DISTRO_NICKNAME//\//-}"
  echo "Testing smallstep-agent-install.sh on ${DISTRO_NICKNAME}..."
  set e
  docker run -it --rm \
      --name "test-smallstep-agent-install-${DISTRO_NICKNAME}" \
      -e STEP_AGENT_TEAM=foo \
      -e DEBIAN_FRONTEND=noninteractive \
      -v ${SCRIPT_DIR}/../smallstep-agent-install.sh:/smallstep-agent-install.sh:Z \
      "${DISTRO}" \
      ./smallstep-agent-install.sh || EXITCODE=$?
  set -e
  if [[ "${EXITCODE}" -ne 1 ]]; then
    TEST_REPORT+=("${DISTRO}: Passed!")
  else
    TEST_REPORT+=("${DISTRO}: Failed!")
  fi
done

echo ""
echo "Smallstep Agent Installer Test Report"
printf '%s\n' "${TEST_REPORT[@]}"
