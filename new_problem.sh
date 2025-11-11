#!/bin/bash

# LeetCode Problem File Creator
# Usage: ./new_problem.sh <problem-number> "<problem-title>" <category> [language]
# Example: ./new_problem.sh 1 "Two Sum" arrays python

if [ "$#" -lt 3 ]; then
    echo "Usage: ./new_problem.sh <problem-number> \"<problem-title>\" <category> [language]"
    echo "Example: ./new_problem.sh 1 \"Two Sum\" arrays swift"
    echo ""
    echo "Available categories:"
    echo "  arrays, stacks-queues, two-pointers, sliding-window, linked-lists,"
    echo "  binary-search, trees, tries, heaps, backtracking"
    echo ""
    echo "Available languages: swift (default), python, javascript"
    exit 1
fi

PROBLEM_NUMBER=$1
PROBLEM_TITLE=$2
CATEGORY=$3
LANGUAGE=${4:-swift}

# Convert problem title to slug (lowercase, hyphens)
PROBLEM_SLUG=$(echo "$PROBLEM_TITLE" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')

# Determine file extension and template
if [ "$LANGUAGE" = "python" ] || [ "$LANGUAGE" = "py" ]; then
    EXTENSION="py"
    TEMPLATE="templates/python_template.py"
elif [ "$LANGUAGE" = "javascript" ] || [ "$LANGUAGE" = "js" ]; then
    EXTENSION="js"
    TEMPLATE="templates/javascript_template.js"
else
    EXTENSION="swift"
    TEMPLATE="templates/swift_template.swift"
fi

# Create filename
FILENAME="${PROBLEM_NUMBER}-${PROBLEM_SLUG}.${EXTENSION}"
FILEPATH="${CATEGORY}/${FILENAME}"

# Check if category exists
if [ ! -d "$CATEGORY" ]; then
    echo "Error: Category '$CATEGORY' does not exist."
    echo "Available categories: arrays, stacks-queues, two-pointers, sliding-window,"
    echo "                      linked-lists, binary-search, trees, tries, heaps, backtracking"
    exit 1
fi

# Check if file already exists
if [ -f "$FILEPATH" ]; then
    echo "Error: File '$FILEPATH' already exists."
    exit 1
fi

# Copy template to new file
cp "$TEMPLATE" "$FILEPATH"

# Replace placeholders in the new file
sed -i '' "s/\[Problem Number\]/$PROBLEM_NUMBER/g" "$FILEPATH"
sed -i '' "s/\[Problem Title\]/$PROBLEM_TITLE/g" "$FILEPATH"
sed -i '' "s/\[problem-slug\]/$PROBLEM_SLUG/g" "$FILEPATH"

echo "✅ Created: $FILEPATH"
echo ""
echo "Next steps:"
echo "1. Open the file and fill in the problem details"
echo "2. Implement your solution"
echo "3. Test your solution"
echo "4. Run: git add . && git commit -m \"Solve: $PROBLEM_NUMBER - $PROBLEM_TITLE\" && git push"
