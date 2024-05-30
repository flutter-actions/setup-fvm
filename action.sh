#!/bin/bash
export FVM_VERSION=${1:-"latest"}
exec "${GITHUB_ACTION_PATH}/hacks/install.sh" ${FVM_VERSION}
