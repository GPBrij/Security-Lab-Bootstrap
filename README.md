# Security Lab Bootstrap

PowerShell portfolio scripts for validating and preparing an authorized local defensive-security and AI learning environment.

## Two-dimensional metafield view

```text
                         LAB LIFECYCLE
                 DISCOVER   PREPARE   VALIDATE   LEARN
LAB DOMAIN
Developer tools     [X]       [X]       [X]       [X]
Local AI runtime    [X]       [X]       [X]       [X]
Security tools      [X]       [X]       [X]       [X]
Configuration       [X]       [X]       [X]       [X]

METAFIELDS
Purpose   : Repeatable local learning environment
Input     : Installed tools, local services, configuration files
Process   : Detect, guide, validate, report
Output    : Lab status and setup guidance
Authority : Local systems and explicitly authorized targets only
Risk      : Downloads, package changes, resource consumption
Evidence  : Tool status, API response, configuration presence
```

## Included scripts

- `Check-Lab-Status.ps1`
- `Master-Lab-Setup.ps1`
- `VerifyVSCodeContinueOllamaConfig.ps1`

## Authorized-use statement

Use security tools only on systems and networks where explicit authorization has been granted. The repository does not provide permission to assess third-party systems.

## Documentation map

- [Two-dimensional architecture and metafields](docs/Architecture-2D-Metafields.md)
- [Detailed architecture](docs/Architecture.md)
- [Script catalog](docs/Script-Catalog.md)
- [Usage guidance](docs/Usage.md)
- [Testing and quality assurance](docs/Testing.md)
- [Business value](docs/Business-Value.md)
- [Pre-publication checklist](PRE-PUBLISH-CHECKLIST.md)

## Visual assets

- Editable Mermaid source: `assets/diagrams/architecture.mmd`
- Screenshot guidance: `assets/screenshots/README.md`
