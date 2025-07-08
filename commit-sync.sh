#!/bin/bash

echo "📝 Committing and pushing sync changes..."
echo "======================================="

# Check if there are changes to commit
if [ -z "$(git status --porcelain)" ]; then
    echo "✅ No changes to commit"
    exit 0
fi

# Show what will be committed
echo "📋 Changes to commit:"
git status --short

# Add all changes
echo "📦 Adding changes..."
git add .

# Commit with timestamp
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
COMMIT_MSG="Sync upstream changes - $TIMESTAMP

- Merged latest upstream changes
- Preserved local bundle ID changes (com.mattsaer.bitchat)
- Preserved development team configuration
- Regenerated Xcode project"

echo "💾 Committing changes..."
git commit -m "$COMMIT_MSG"

# Push to fork
echo "🚀 Pushing to fork..."
git push origin main

echo ""
echo "✅ Sync committed and pushed!"
echo "🎯 Your fork is now up to date with latest upstream changes"
echo "🔧 Test the app in Xcode to make sure everything works" 