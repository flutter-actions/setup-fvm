#!/bin/bash
export FVM_VERSION=${1:-"latest"}
export FVM_WORKSPACE=${2:-"${GITHUB_WORKSPACE}"}
export FVM_CACHE_PATH="${RUNNER_TEMP}/fvm_cache"
export FVM_GIT_CACHE_PATH="${RUNNER_TEMP}/fvm_git_cache"
export FLUTTER_PUB_CACHE="${RUNNER_TEMP}/flutter/pub-cache"

echo "::group::Installing FVM version ${FVM_VERSION}"
source "${GITHUB_ACTION_PATH}/hacks/install.sh"
echo "::endgroup::"

# Configure pub to use a fixed location.
echo "PUB_CACHE=${FLUTTER_PUB_CACHE}" >> $GITHUB_ENV
mkdir -p $FLUTTER_PUB_CACHE

echo "::group::Setting up FVM workspace"
if cd ${FVM_WORKSPACE}; then
	echo "Changed workspace directory to ${FVM_WORKSPACE}"
else
	echo "::error::Failed to change workspace directory to ${FVM_WORKSPACE}"
	exit 1
fi

# Check if .fvmrc file exists
if [ ! -f ".fvmrc" ]; then
	echo "::error::No .fvmrc file found in the workspace. Please create one to specify the Flutter SDK version."
	exit 1
fi

echo "Detected .fvmrc file, using it to install Flutter SDK"
echo -e "yes\nyes\n" | fvm install

# Invoke Flutter SDK to suppress the analytics.
fvm flutter --version --suppress-analytics 2>&1 >/dev/null

# Disable Google Analytics and CLI animations
fvm flutter config --no-analytics 2>&1 >/dev/null
fvm flutter config --no-cli-animations 2>&1 >/dev/null

# Report success, and print version.
echo "Succesfully installed Flutter SDK:"
echo "------------------------------------------------------------------------------"
fvm dart --version
fvm flutter --version
echo "::endgroup::"
