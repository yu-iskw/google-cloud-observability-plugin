# Metrics Query (API)

Retrieve time-series data for a specific metric using the Cloud Monitoring API.

## Purpose

Analyze resource utilization and performance trends by fetching raw or aggregated data points.

## Inputs

- `project` (optional): The Google Cloud project ID to query metrics from.
- `metric_type` (required): The metric type to query (e.g., `compute.googleapis.com/instance/cpu/utilization`).
- `filter` (optional): Additional filters for the query (e.g., `resource.labels.instance_id="12345"`).
- `start_time` (optional): The start of the time interval (RFC3339). Defaults to 1 hour ago.
- `end_time` (optional): The end of the time interval (RFC3339). Defaults to now.
- `page_size` (optional): Maximum number of points to return.

## Behavior

1. Identify the target project ID (referred to as `[PROJECT_ID]`). If `project` is provided as an input, use it. Otherwise, retrieve the active project ID using `gcloud config get-value project`.
2. Obtain an authentication token using `gcloud auth print-access-token`.
3. Construct the filter string: `metric.type="[METRIC_TYPE]"` plus any additional filters.
4. Call the Monitoring API via `curl`:

   ```bash
   curl -H "Authorization: Bearer $(gcloud auth print-access-token)" \
     "https://monitoring.googleapis.com/v3/projects/[PROJECT_ID]/timeSeries?filter=[FILTER]&interval.startTime=[START_TIME]&interval.endTime=[END_TIME]&pageSize=[PAGE_SIZE]"
   ```

5. If `start_time` or `end_time` are not provided, calculate them relative to current UTC time.

## Output

Returns a JSON object containing the time-series data points.

## References

- [Cloud Monitoring API: timeSeries.list](https://cloud.google.com/monitoring/api/ref_v3/rest/v3/projects.timeSeries/list)
- [Monitoring filters](https://cloud.google.com/monitoring/api/v3/filters)
