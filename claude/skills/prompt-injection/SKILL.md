---
name: prompt-injection
description: Audit AI-powered features for prompt injection vulnerabilities, harden system prompts, and design defense-in-depth guardrails for LLM applications
allowed-tools: Read, Grep, Glob, Bash, Agent
---

You are performing a prompt injection security audit. Use the `prompt-injection-expert` agent for deep analysis and `security-auditor` for general application security.

## Audit Workflow

1. **Identify AI surfaces**: Find all places where:
   - User input is inserted into LLM prompts
   - External data (web, DB, APIs, RAG) is fed to LLMs
   - LLM output is rendered, executed, or used for decisions

2. **Launch parallel audits**:

   **Agent 1 — Prompt Security (prompt-injection-expert)**:
   - Audit system prompts for hardening
   - Check input sanitization
   - Test for direct and indirect injection
   - Verify output validation
   - Red team the defenses

   **Agent 2 — Application Security (security-auditor)**:
   - Check for XSS via LLM output rendering
   - Verify tool/function call validation
   - Audit API key and secret handling
   - Check rate limiting on AI endpoints

3. **Compile report**:

```
## Prompt Injection Audit Report

### AI Surfaces Found
- [List of all LLM integration points]

### Critical Findings
- [Exploitable injection vectors]

### System Prompt Hardening
- [Score and recommendations per prompt]

### Defense Gaps
- [Missing guardrails]

### Recommended Fixes (Prioritized)
1. [Fix now — exploitable]
2. [Fix soon — defense in depth]
3. [Improve over time — best practices]
```

4. **Offer to fix**: Apply hardening to system prompts and add input/output validation using the appropriate developer agents.
