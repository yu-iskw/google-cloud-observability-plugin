#!/bin/bash

# Cloud Pulse: Hook to validate gcloud commands at runtime

# Read JSON input from stdin
INPUT=$(cat)
COMMAND=$(echo "${INPUT}" | jq -r '.tool_input.command // empty')

# Only validate if it's a gcloud command
if [[ ! ${COMMAND} =~ ^gcloud ]]; then
	exit 0
fi

REASON=""
DECISION="allow"

# 1. Project Isolation: Must contain --project
if [[ ! ${COMMAND} =~ --project ]]; then
	REASON="Missing mandatory --project flag for isolation."
	DECISION="deny"
fi

# 2. Machine Readability & Context Management: list or read must contain --format=json and --limit
if [[ ${COMMAND} =~ " list " ]] || [[ ${COMMAND} =~ " read " ]]; then
	if [[ ! ${COMMAND} =~ --format=json ]]; then
		REASON="${REASON} Missing mandatory --format=json for list/read commands."
		DECISION="deny"
	fi
	if [[ ! ${COMMAND} =~ --limit ]]; then
		REASON="${REASON} Missing mandatory --limit flag for list/read commands to prevent token overflow."
		DECISION="deny"
	fi
fi

# 3. Destructive Guard: delete, remove, update, set without --dry-run must escalate
if [[ ${COMMAND} =~ " delete " ]] || [[ ${COMMAND} =~ " remove " ]] || [[ ${COMMAND} =~ " update " ]] || [[ ${COMMAND} =~ " set " ]]; then
	if [[ ! ${COMMAND} =~ --dry-run ]]; then
		# If it was already denied by other rules, keep it denied.
		# Otherwise, escalate to "ask".
		if [[ ${DECISION} != "deny" ]]; then
			DECISION="ask"
			REASON="Destructive or state-changing command detected without --dry-run."
		fi
	fi
fi

# Construct response
if [[ ${DECISION} == "allow" ]]; then
	exit 0
else
	jq -n --arg decision "${DECISION}" --arg reason "${REASON}" '{
		hookSpecificOutput: {
			hookEventName: "PreToolUse",
			permissionDecision: $decision,
			permissionDecisionReason: $reason
		}
	}'
fi

exit 0
