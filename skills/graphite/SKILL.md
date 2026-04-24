---
name: graphite
description: Use Graphite CLI for stacked diffs, stack status, submitting changes, and branch workflows. Use when the
 user mentions Graphite, gt, stacks, stacked PRs, or submitting with Graphite.
---

# Graphite Skill

Use the `gt` CLI directly. Do not use MCP.

Common commands:

```bash
    gt status
    gt log
    gt stack
    gt submit
    gt sync
    gt branch create
    gt branch checkout
```

Before running mutating commands like gt submit, explain the action and confirm with the user unless they explicitly asked for it.

You can create it with:

```bash
    mkdir -p ~/.agents/skills/graphite
    cat > ~/.agents/skills/graphite/SKILL.md <<'EOF'
```
