#!/bin/bash

echo "🔄 Syncing bitchat fork with upstream..."
echo "========================================"

# Check if we're in the right directory
if [ ! -f "project.yml" ]; then
    echo "❌ Error: Run this script from the bitchat directory"
    exit 1
fi

# Stash local changes
echo "📦 Stashing local changes..."
git stash push -m "Local signing and bundle ID fixes - $(date)"

# Fetch upstream changes
echo "📥 Fetching upstream changes..."
git fetch upstream

# Show what's new
echo "📋 New commits from upstream:"
git log --oneline main..upstream/main

# Merge upstream changes
echo "🔀 Merging upstream changes..."
git merge upstream/main

# Restore local changes
echo "📤 Restoring local changes..."
git stash pop

# Regenerate Xcode project
echo "🔨 Regenerating Xcode project..."
xcodegen generate

# Show status
echo "📊 Current status:"
git status --short

echo ""
echo "✅ Sync complete!"
echo "🔧 Next steps:"
echo "   1. Review changes with: git diff"
echo "   2. Test the app in Xcode"
echo "   3. Commit changes with: git add . && git commit -m 'Sync upstream changes'"
echo "   4. Push to fork with: git push origin main"
echo ""
echo "🎯 Or run: ./commit-sync.sh (if you want to auto-commit)" 