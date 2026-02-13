# Logs Tail

Stream logs in real-time.

## Purpose

Watch live logs for immediate feedback during an incident or deployment.

## Behavior

1. Execute `gcloud alpha logging tail [FILTER] --buffer-window=[BUFFER_WINDOW] --format=json`.
2. The `--format=json` flag is recommended for programmatic consumption.
3. Stop streaming after the specified duration or when interrupted.

## Inputs

- `filter` (optional): A valid Cloud Logging filter string.
- `buffer_window` (optional): The duration of the buffer window for reordering logs (e.g., `5s`).
- `duration` (optional): How long to stream logs for in seconds. Defaults to 30s.

## Output

Streams log entries (JSON formatted if requested) to the terminal.

## References

- [gcloud alpha logging tail](https://cloud.google.com/sdk/gcloud/reference/alpha/logging/tail)
