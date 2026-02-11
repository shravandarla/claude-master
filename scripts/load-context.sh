#!/bin/bash
# load-context.sh
# Helper script to display the project structure and loaded configurations.
# Used by session start hooks to verify the environment.

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "=== Claude Code Project Structure ==="
echo ""

# Check for CLAUDE.md
if [ -f "$PROJECT_ROOT/CLAUDE.md" ]; then
    echo "[OK] CLAUDE.md found (master rules file)"
else
    echo "[!!] CLAUDE.md NOT FOUND - create it at project root"
fi

# Check agents
echo ""
echo "--- Agents ---"
if [ -d "$PROJECT_ROOT/agents" ]; then
    for agent in "$PROJECT_ROOT/agents"/*.md; do
        if [ -f "$agent" ]; then
            echo "  [OK] $(basename "$agent")"
        fi
    done
else
    echo "  [!!] agents/ directory not found"
fi

# Check rules
echo ""
echo "--- Rules ---"
if [ -d "$PROJECT_ROOT/rules" ]; then
    for rule in "$PROJECT_ROOT/rules"/*.md; do
        if [ -f "$rule" ]; then
            echo "  [OK] $(basename "$rule")"
        fi
    done
else
    echo "  [!!] rules/ directory not found"
fi

# Check docs
echo ""
echo "--- Documentation ---"
if [ -d "$PROJECT_ROOT/docs" ]; then
    for doc in "$PROJECT_ROOT/docs"/*.md; do
        if [ -f "$doc" ]; then
            echo "  [OK] $(basename "$doc")"
        fi
    done
else
    echo "  [!!] docs/ directory not found"
fi

# Check templates
echo ""
echo "--- Templates ---"
if [ -d "$PROJECT_ROOT/templates" ]; then
    for tmpl in "$PROJECT_ROOT/templates"/*.md; do
        if [ -f "$tmpl" ]; then
            echo "  [OK] $(basename "$tmpl")"
        fi
    done
else
    echo "  [!!] templates/ directory not found"
fi

echo ""
echo "=== All configurations loaded ==="
