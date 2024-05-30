#!/bin/bash
export FVM_VERSION=${1:-"latest"}
export FVM_CACHE_PATH="${RUNNER_TEMP}/fvm_cache"
export FVM_GIT_CACHE_PATH="${RUNNER_TEMP}/fvm_git_cache"
exec "${GITHUB_ACTION_PATH}/hacks/install.sh" ${FVM_VERSION}
