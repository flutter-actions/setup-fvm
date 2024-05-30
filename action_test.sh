#!/bin/bash
export ACTION_TEST_DIR="$(pwd)/.setup-flutter"

# GitHub Context
export GITHUB_ACTION_PATH="$(pwd)"
export GITHUB_ENV="$ACTION_TEST_DIR/.GITHUB_ENV"
export GITHUB_PATH="$ACTION_TEST_DIR/.GITHUB_PATH"

# Runner environment variables
export RUNNER_TOOL_CACHE="$ACTION_TEST_DIR/tool_cache"

# Create mock environment
mkdir -p "$RUNNER_TOOL_CACHE"
touch "$GITHUB_ENV" "$GITHUB_PATH"

# Run the action
./action.sh "$@"
