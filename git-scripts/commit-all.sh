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

# Commit changes in the main repository
echo "Processing main repository..."
commit_changes

# Ask if the i wants to push these changes
# Ask if the user wants to push changes
read -p "Do you want to push all changes? (y/n): " PUSH_CHOICE

if [[ $PUSH_CHOICE == "y" || $PUSH_CHOICE == "Y" ]]; then
    # Push changes in submodules first
    echo "Pushing changes in submodules..."
    git submodule foreach --recursive '
    if [ -n "$(git log --branches --not --remotes)" ]; then
        echo "Pushing changes in submodule: $name"
        git push || echo "Failed to push submodule: $name"
    else
        echo "No changes to push in submodule: $name"
    fi
    '

    # Push changes in the main repository
    echo "Pushing changes in main repository..."
    if git push; then
        echo "Main repository changes pushed successfully."
    else
        echo "Failed to push main repository changes."
    fi
else
    echo "Push operation skipped."
fi

echo "Script execution complete."