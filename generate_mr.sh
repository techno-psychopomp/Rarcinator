#!/bin/bash

# Set the repository name, branch name, and commit message
repository="Rarcinator"
branch="grammar_fixes"
commit_message="grammar and spelling fixes"

# Add changes to the commit
git add .

# Commit changes with a unique message containing the file name
git diff --name-only --cached | while read -r file; do
  commit_message+="$(basename $file), "
done

commit_message="Commit changes: ${commit_message%, }"

git commit -m "$commit_message"

# Push the changes to the branch
git push origin $branch

# Get the current branch's SHA
sha=$(git rev-parse HEAD)

# Create a Pull Request
response=$(curl -X POST -H "Authorization: Bearer " \
  -d '{"title": "'"$commit_message"'", "head": "'"$branch"'", "base": "master"}' \
 https://api.github.com/repos/techno-psychopomp/$repository/pulls)

# Extract the pull request number from the response
pull_request_number=$(echo $response | jq -r '.number')

# Generate the pull request URL
pull_request_url="https://github.com/your-username/$repository/pull/$pull_request_number"

# Output the pull request URL
echo "Pull Request created: $pull_request_url"
