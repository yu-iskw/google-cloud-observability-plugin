# Errors Groups

List aggregated error groups from Cloud Error Reporting.

## Purpose

Identify the most frequent and impactful errors in a project.

## Inputs

- `project` (optional): The Google Cloud project ID to list error groups from.
- `service` (optional): Filter by service name.
- `limit` (optional): Maximum number of groups to return. Defaults to 10.
- `order_by` (optional): Sort the results. Valid values are `last-seen`, `created`, `count`, `affected-users`. Prefix with `-` for descending (e.g., `-count`).
- `time_range` (optional): The time range for which to list error groups. Examples: `1h`, `1d`, `30d`.

## Behavior

1. Execute `gcloud beta error-reporting groups list --project=[PROJECT] --service=[SERVICE] --limit=[LIMIT] --sort-by=[ORDER_BY] --time-range=[TIME_RANGE] --format=json`.
2. If `project` is not provided, use the active project from `gcp-context`.
3. If `order_by` is not provided, defaults to `-count` to show most frequent errors first.

## Output

Returns a JSON list of error groups.

## References

- [gcloud beta error-reporting groups list](https://cloud.google.com/sdk/gcloud/reference/beta/error-reporting/groups/list)
- [Error Reporting Documentation](https://cloud.google.com/error-reporting/docs)
