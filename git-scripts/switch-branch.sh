#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <branch-name>"
    exit 1
fi

BRANCH=$1

# Switch the main repository to the specified branch
echo "Switching main repository to branch: $BRANCH"
git checkout "$BRANCH"
if [ $? -ne 0 ]; then
    echo "Failed to switch main repository to branch: $BRANCH"
    exit 1
fi

# Update submodules to ensure they are initialized
echo "Initializing and updating submodules..."
git submodule update --init --recursive

# Switch all submodules to the specified branch
echo "Switching all submodules to branch: $BRANCH"
git submodule foreach --recursive "git checkout $BRANCH || echo 'Branch $BRANCH does not exist in submodule'"

# Update submodules to match the branch and main repo's references
echo "Updating submodules to remote tracking branch: $BRANCH"
git submodule update --remote --recursive

echo "Switched main repository and all submodules to branch: $BRANCH"
