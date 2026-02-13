#!/bin/bash

# Cloud Pulse: Hook to verify gcloud environment on agent start

echo "Checking Google Cloud environment..."

# Check if gcloud is installed
if ! command -v gcloud &>/dev/null; then
	echo "Error: gcloud CLI not found. Please install the Google Cloud SDK."
	exit 1
fi

# Check if authenticated
ACCOUNT=$(gcloud config get-value account 2>/dev/null)
if [[ -z ${ACCOUNT} ]]; then
	echo "Warning: No active Google Cloud account found. Run 'gcloud auth login' to authenticate."
fi

# Check if project is set
PROJECT=$(gcloud config get-value project 2>/dev/null)
if [[ -z ${PROJECT} ]]; then
	echo "Warning: No active Google Cloud project set. Run 'gcloud config set project [PROJECT_ID]' to set one."
else
	echo "Active Google Cloud project: ${PROJECT}"
fi

exit 0
