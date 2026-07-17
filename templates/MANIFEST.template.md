# MANIFEST — <PROJECT NAME>

## Dock declaration
<Self-contained, or spans multiple houses? State it plainly.>

## Environment
- Language/runtime + version:
- Run: <command>
- Test: <command>
- Dependencies: <manifest file, or "standard library only">

## Houses
<Which physically separate locations the project spans (shareable / internal / ...),
and where each lives. If one house: say "single house, all here".>

## Capabilities needed to continue
<Tools/skills/access a model needs to both run and extend the project.
External services, secrets, network: list or state "none".>

## Code repos also declare
- Dependency manifest present: <yes/no + path>
- Raw-data provenance (the query/fetch that produced any *_raw artifact): <where>
- Config for external services (endpoint, params, rate limit, ToS, keys): <where>
- Inter-piece interface (fields, keys, format between stages): <where>
