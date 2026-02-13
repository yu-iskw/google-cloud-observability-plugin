# Logs List

List available log names in the project.

## Purpose

Discovery of which logs are available to help refine search filters.

## Inputs

- `bucket` (optional): List logs in a specific log bucket.
- `view` (optional): List logs in a specific log view.

## Behavior

1.  Execute `gcloud logging logs list --format=json`.
2.  If `bucket` or `view` is provided, append the respective flags.
3.  Optionally filter for specific log types if needed by the caller.

## Output

Returns a JSON list of log names.

## References

- [gcloud logging logs list](https://cloud.google.com/sdk/gcloud/reference/logging/logs/list)
