# gcloud Safety Rules

These rules ensure that `gcloud` commands are executed safely and predictably by agents and humans.

## Command Execution

- **Format**: Always use `--format=json` for machine-readability when the output is intended for processing by another tool or agent.
- **Limit**: Mandatory `--limit=50` (or a specific small number) on all list/read commands to prevent token overflow and excessive data transfer.
- **Project Isolation**: All `gcloud` commands should explicitly include the `--project` flag unless the command is specifically meant to manage configurations.
- **Quoting**: All filters must be single-quoted (e.g., `--filter='resource.type=gce_instance'`) to prevent shell injection and ensure correct parsing.

## Destructive Operations

- **Verification**: Never execute `delete`, `remove`, `update`, `set`, or any command that modifies state without explicit user confirmation.
- **Dry Run**: When available, use `--dry-run` or similar flags before suggesting a destructive command.

## Authentication & Context

- **Active Account**: Verify the active account with `gcloud auth list` before performing any privileged operations.
- **Active Project**: Ensure the target project is correctly identified using `gcloud config get-value project` or equivalent.
