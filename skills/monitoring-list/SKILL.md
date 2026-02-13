# Metrics List

List available metric descriptors in Cloud Monitoring.

## Purpose

Discover available metrics to query for performance and health analysis.

## Inputs

- `project` (optional): The Google Cloud project ID to list metrics from.
- `metric_filter` (optional): Filter for specific metric types (e.g., `metric.type=starts_with("compute.googleapis.com/")`).
- `resource_filter` (optional): Filter for specific resource types (e.g., `resource.type="gce_instance"`).

## Behavior

1. Construct the filter string. If both filters are provided, combine them with `AND`.
2. Execute `gcloud monitoring metric-descriptors list --project=[PROJECT] --filter="[FILTER]" --format=json`.
3. If `project` is not provided, use the active project from `gcp-context`.

## Output

Returns a JSON list of metric descriptors.

## References

- [gcloud monitoring metric-descriptors list](https://cloud.google.com/sdk/gcloud/reference/monitoring/metric-descriptors/list)
- [Metric types](https://cloud.google.com/monitoring/api/metrics)
