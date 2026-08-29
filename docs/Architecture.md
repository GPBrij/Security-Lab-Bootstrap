# Architecture

## Two-dimensional line map

```text
                              VALIDATION DIMENSION
                 TOOL -------- SERVICE -------- CONFIG
                   |              |               |
VS Code ---------- Installed ----- Running ------- Extensions
                   |              |               |
Ollama ----------- Installed ----- Local API ----- Models
                   |              |               |
Security Tools --- Available ----- Isolated ------ Authorized scope

GOVERNANCE AXIS: Authorization | Source | Integrity | Resource | Evidence
```

## Component flow

```mermaid
flowchart LR
    A[Local workstation] --> B[Dependency discovery]
    B --> C[Tool status checks]
    C --> D[Local service validation]
    D --> E[Configuration validation]
    E --> F[Lab readiness report]
```

## Design safeguards

- Prefer validation before installation.
- Verify package sources and hashes.
- Bind local AI services only to intended interfaces.
- Keep scan output, packet captures, credentials, and private prompts out of Git.
- Do not automate testing against third-party systems.
