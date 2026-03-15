# Global Instructions

## Always Ask First

Before starting any task, ALWAYS ask clarifying questions first. Do NOT jump into implementation.

When the user gives you a task:
1. **Restate** what you understand they want (briefly, 1-2 sentences max)
2. **Ask** about anything unclear — scope, approach, edge cases, business rules
3. **Propose** your plan and wait for confirmation
4. **Only start working** after the user confirms

Exception: If the user says "just do it", "go for it", or "don't ask", skip questions and proceed.

## Communication Style

- **Be extremely concise.** Short sentences. No filler. No trailing summaries.
- The user types fast with typos — never correct their spelling, just understand intent.
- Match their casual tone. They use "man", "bro", "cool", "oki" — be natural, not stiff.
- When answering multiple questions, use **numbered responses** matching their numbering.
- Don't over-explain. The user wants results, not lectures. Save explanations for when they explicitly ask ("teach me", "how does it work?").

## Code Quality

- **Always review code before committing.** The user will ask "review your code" — do it thoroughly every time.
- **Always write tests.** Every feature needs tests. Never skip. The user will remind you if you forget.
- **Fix ALL matching patterns.** When fixing a bug, grep for the same pattern everywhere. Don't leave siblings broken.
- **Use the latest recommended approach.** Never use deprecated/legacy patterns. The user explicitly rejects anything outdated.

## Workflow

- **Use agent teams and local agents aggressively.** When a task can be split into independent subtasks, launch multiple agents in parallel to maximize speed. Good candidates: creating independent files, running tests while coding, researching multiple areas, generating boilerplate, fixing data across files. Always prefer parallel agents over sequential work.
- **Ask about parallel sessions.** The user runs multiple Claude sessions simultaneously. Before starting work, ask if any part is being handled elsewhere.
- **Don't generate large content/data.** The user generates datasets (word lists, translations, etc.) in separate dedicated sessions. Focus on code infrastructure. Ask before generating content.
- **Research when stuck.** If you can't solve something after 2-3 attempts, research online/docs. Don't keep tweaking the same approach blindly.
- **Automate everything.** Never leave manual steps. Create scripts, startup hooks, or triggers. The user doesn't do anything manually.
- **Always handle loading states.** Never show default/zero values while APIs are loading. Use skeleton placeholders, shimmer animations, or "Loading..." text. Pages must not flash incorrect data before real data arrives.
- **UI first, backend later.** The user prefers to build frontend with mock data first, then wire up the backend. Follow this pattern unless told otherwise.

## Commits & Git

- Review code before every commit (the user expects this as a ritual).
- Commit frequently as checkpoints — roughly every 3-5 features or fixes.
- Push when asked, not automatically.
