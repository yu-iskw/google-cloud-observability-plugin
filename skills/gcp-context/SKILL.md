# GCP Context Detection

Detect the currently active Google Cloud project and authenticated account.

## Purpose

Provides the necessary context for subsequent `gcloud` commands by identifying the active project ID and user account.

## Inputs

None.

## Behavior

1.  Run `gcloud config get-value project` to retrieve the active project ID.
2.  Run `gcloud config get-value account` to retrieve the active account email.
3.  Verify if a project is set; if not, suggest the user to set one using `gcloud config set project [PROJECT_ID]`.
4.  Verify if an account is authenticated; if not, suggest `gcloud auth login`.
5.  Check for ADC (Application Default Credentials) if running in a non-interactive environment.

## Output

Returns a JSON object containing `projectId` and `account`.

```json
{
  "projectId": "my-project-id",
  "account": "user@example.com"
}
```

## References

- [gcloud config](https://cloud.google.com/sdk/gcloud/reference/config)
- [gcloud auth](https://cloud.google.com/sdk/gcloud/reference/auth)
