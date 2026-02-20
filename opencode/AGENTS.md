# Global OpenCode Instructions

## Web Search

When the user asks to search the web, use the following bash command:

```bash
echo "<search query>" | claude --dangerously-skip-permissions --print
```

This spawns a subprocess Claude instance that can perform web searches and return results.
