# Errors List

List individual error events from Cloud Error Reporting.

## Purpose

Retrieve detailed error events, including stack traces and service context, for deep-dive analysis.

## Inputs

- `group_id` (required): The ID of the error group to list events for.
- `service` (optional): Filter by service name.
- `limit` (optional): Maximum number of events to return. Defaults to 20.
- `time_range` (optional): The time range for which to list error events. Examples: `1h`, `1d`, `30d`.

## Behavior

1.  Execute `gcloud beta error-reporting events list --group-id=[GROUP_ID] --service=[SERVICE] --limit=[LIMIT] --time-range=[TIME_RANGE] --format=json`.

## Output

Returns a JSON list of error events.

## References

- [gcloud beta error-reporting events list](https://cloud.google.com/sdk/gcloud/reference/beta/error-reporting/events/list)
- [Viewing error details](https://cloud.google.com/error-reporting/docs/viewing-errors)
