#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Add aybeshlikyan.github.io as submodule
# rm -rf public
# git submodule add -b master https://github.com/aybeshlikyan/aybeshlikyan.github.io.git public

# Build the project.
hugo -t highlights # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
    msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
