#!/bin/bash

# Quick Git Commit and Push for LeetCode Solutions
# Usage: ./quick_commit.sh <problem-number> "<problem-title>"
# Example: ./quick_commit.sh 1 "Two Sum"

if [ "$#" -ne 2 ]; then
    echo "Usage: ./quick_commit.sh <problem-number> \"<problem-title>\""
    echo "Example: ./quick_commit.sh 1 \"Two Sum\""
    exit 1
fi

PROBLEM_NUMBER=$1
PROBLEM_TITLE=$2
COMMIT_MESSAGE="Solve: $PROBLEM_NUMBER - $PROBLEM_TITLE"

echo "📝 Staging changes..."
git add .

echo "💾 Committing with message: $COMMIT_MESSAGE"
git commit -m "$COMMIT_MESSAGE"

echo "🚀 Pushing to remote..."
git push origin main

echo "✅ Done! Solution committed and pushed."
