# Logs Read

Read log entries from Google Cloud Logging.

## Purpose

Retrieve log entries based on a filter. This is the primary tool for investigating past events and errors.

## Inputs

- `filter` (optional): A valid Cloud Logging filter string. Defaults to empty (all logs).
- `limit` (optional): Maximum number of entries to return. Defaults to 20. Max 1000.
- `order` (optional): Sort order of entries (`asc` or `desc`). Defaults to `desc` (newest first).
- `freshness` (optional): Only read entries as old as this duration (e.g., `1h`, `5h`, `1d`).
- `bucket` (optional): The log bucket to read from.
- `view` (optional): The log view to read from.

## Behavior

1. Validate that `limit` does not exceed 1000.
2. Construct the command with provided flags: `gcloud logging read "[FILTER]" --limit=[LIMIT] --order=[ORDER] --format=json`.
3. Append `--freshness=[FRESHNESS]` if provided.
4. Append `--bucket=[BUCKET]` and `--view=[VIEW]` if provided.
5. Ensure the command is scoped to the active project.

## Output

Returns a JSON list of log entries.

## References

- [gcloud logging read](https://cloud.google.com/sdk/gcloud/reference/logging/read)
- [Logging query language](https://cloud.google.com/logging/docs/view/logging-query-language)
- [Common log filters](https://cloud.google.com/logging/docs/view/query-library)
