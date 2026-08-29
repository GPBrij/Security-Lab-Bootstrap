# Script Catalog

## Check-Lab-Status.ps1

- Purpose: Checks selected local lab dependencies and services.
- Input: Installed applications and local endpoints.
- Output: Readiness status.
- Risk: Local service paths and configuration should not be exposed publicly.

## Master-Lab-Setup.ps1

- Purpose: Provides a repeatable setup sequence for selected learning tools.
- Input: Tool requirements and trusted download sources.
- Output: Setup guidance or installation activity.
- Risk: Downloads and package installation require source validation.

## VerifyVSCodeContinueOllamaConfig.ps1

- Purpose: Validates VS Code, Continue, and Ollama-related local configuration.
- Input: Local tools, files, services, and model state.
- Output: Configuration findings.
- Risk: Do not publish local paths, prompts, secrets, or proprietary code.
