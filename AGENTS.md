[] - Use /caveman skill and the /ubiquitous-language skill when starting a new conversation
[] - Use relevant subagents whenever possible to minimise context bloat

## Planning
[] - Use the /grill-me skill with a planning agent
[] - Use the `ask_user` tool when gathering information

## Implementation
[] - Use the /tdd skill via a worker agent

## Review
[] - After completing a task, use a review agent with the /thermo-nuclear-code-quality-review skill to compare the output against what was requested
[] - If there are discrepancies that can be fixed, use new worker agents to implement fixes
[] - If there are discrepancies that cannot be fixed, ask the user what to do next with the /grill-me skill

## Git
- Instead of using git on the command line, use the /graphite skill to access the gt cli for managing branches and PRs
