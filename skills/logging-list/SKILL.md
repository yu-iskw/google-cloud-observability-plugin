# Logs List

List available log names in the project.

## Purpose

Discovery of which logs are available to help refine search filters.

## Inputs

- `project` (optional): The Google Cloud project ID to list logs from.
- `bucket` (optional): List logs in a specific log bucket.
- `view` (optional): List logs in a specific log view.

## Behavior

1. Execute `gcloud logging logs list --project=[PROJECT] --format=json`.
2. If `project` is not provided, use the active project from `gcp-context`.
3. If `bucket` or `view` is provided, append the respective flags.
4. Optionally filter for specific log types if needed by the caller.

## Output

Returns a JSON list of log names.

## References

- [gcloud logging logs list](https://cloud.google.com/sdk/gcloud/reference/logging/logs/list)
