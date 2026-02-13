#!/bin/bash

# Cloud Pulse: Hook to inject gcloud safety rules into subagents

SAFETY_RULES_FILE="rules/gcloud-safety.md"

if [[ -f ${SAFETY_RULES_FILE} ]]; then
	RULES=$(cat "${SAFETY_RULES_FILE}")
	CONTEXT="IMPORTANT: Adhere to the following gcloud safety rules when executing gcloud commands:\n\n${RULES}"

	jq -n --arg context "${CONTEXT}" '{
		hookSpecificOutput: {
			hookEventName: "SubagentStart",
			additionalContext: $context
		}
	}'
fi

exit 0
