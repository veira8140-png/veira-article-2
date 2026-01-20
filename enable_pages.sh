#!/bin/bash
# Automatically enable GitHub Pages for this repository

# Ensure we're in the repo folder
REPO_NAME=$(basename $(git rev-parse --show-toplevel))
OWNER="veira8140-png"

# Push all changes first
git add .
git commit -m "Final commit before enabling GitHub Pages" 2>/dev/null || echo "No changes to commit"
git push origin main

# Enable GitHub Pages using GitHub CLI
gh api -X POST \
  -H "Accept: application/vnd.github+json" \
  /repos/$OWNER/$REPO_NAME/pages \
  -f source='{"branch":"main","path":"/"}'

# Get the Pages URL
PAGE_URL=$(gh api /repos/$OWNER/$REPO_NAME/pages --jq '.html_url')

echo "✅ GitHub Pages enabled!"
echo "Your live URL is: $PAGE_URL"
