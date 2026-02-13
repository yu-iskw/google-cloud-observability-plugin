# Dashboards List

List custom and default dashboards in Cloud Monitoring.

## Purpose

Identify high-level dashboards that may contain relevant visualizations for the current context.

## Inputs

- `project` (optional): The Google Cloud project ID to list dashboards from.
- `display_name` (optional): Filter for dashboards with a matching display name (case-insensitive).

## Behavior

1. Execute `gcloud monitoring dashboards list --project=[PROJECT] --format=json`.
2. If `project` is not provided, use the active project from `gcp-context`.
3. If `display_name` is provided, filter the results in the CLI or script using `--filter="displayName:[DISPLAY_NAME]"`.

## Output

Returns a JSON list of dashboards.

## References

- [gcloud monitoring dashboards list](https://cloud.google.com/sdk/gcloud/reference/monitoring/dashboards/list)
