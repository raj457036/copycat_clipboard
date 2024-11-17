#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <commit-message>"
    exit 1
fi

COMMIT_MSG=$1

commit_changes() {
    if [ -n "$(git status --porcelain)" ]; then
        echo "Staging and committing changes in $(pwd)"
        git add -A
        git commit -m "$COMMIT_MSG"
    else
        echo "No changes to commit in $(pwd)"
    fi
}

# Commit changes in submodules first
echo "Processing submodules..."
git submodule foreach --recursive '
if [ -n "$(git status --porcelain)" ]; then
    echo "Staging and committing changes in submodule: $name"
    git add -A
    git commit -m "'"$COMMIT_MSG"'"
else
    echo "No changes to commit in submodule: $name"
fi
'

# Commit changes in the main repository
echo "Processing main repository..."
commit_changes

echo "All changes have been committed."