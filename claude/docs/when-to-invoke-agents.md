# When to Invoke Agents vs Follow Skills

## Decision Tree

```
Is this a coding task?
├── YES: Does it involve writing/editing implementation code?
│   ├── YES: Is it a trivial single-line edit (typo, import)?
│   │   ├── YES → Do it directly (no agent)
│   │   └── NO → Invoke the matching agent via Task tool
│   └── NO: Is it research/analysis?
│       ├── YES → Use codebase-analyzer, codebase-locator, or codebase-pattern-finder
│       └── NO → Handle directly
└── NO: Is it documentation, planning, or review?
    ├── YES → Use the matching role agent (docs-guardian, adr, progress-guardian)
    └── NO → Handle directly
```

## Key Distinctions

### Skills = Knowledge to Follow
- Skills are **instructions** that tell you HOW to do something
- You follow skills yourself — they don't spawn separate agents
- Example: "typescript-strict" skill tells you rules to follow when writing TS

### Agents = Workers to Invoke
- Agents are **autonomous workers** you delegate tasks to
- You invoke them via the Task tool with a specific prompt
- Example: "typescript-pro" agent writes the actual TS code

### When Both Apply
- If a skill and agent cover the same domain, invoke the agent AND tell it to follow the skill
- Example: For React work, invoke `react-specialist` agent and reference `frontend-design` skill

## Quick Reference

| Situation | Action |
|---|---|
| Writing Go code | Invoke `golang-pro` |
| Writing React component | Invoke `react-specialist` |
| Need to find a file | Invoke `codebase-locator` |
| Need to understand code | Invoke `codebase-analyzer` |
| Fixing a typo | Do it directly |
| Adding an import | Do it directly |
| Designing an API | Invoke `api-designer` |
| Writing tests | Invoke the language-specific agent |
