# Google Cloud Observability Plugin for Claude Code

A comprehensive plugin for [Claude Code](https://code.claude.com) that provides deep integration with Google Cloud Platform's observability stack. It enables Claude to safely investigate incidents, analyze metrics, and triage errors using specialized agents.

## 🚀 Capabilities

This plugin introduces a squad of specialized agents to handle different aspects of cloud observability:

### 🤖 **Cloud Pulse Orchestrator** (`/cloud-pulse-orchestrator`)

**The Mission Commander.**

- Acts as the primary interface for complex investigations.
- Coordinates the specialists (Logs, Metrics, Errors) to build a holistic view of system health.
- **Use for:** "Why is the checkout service failing?", "Investigate the latency spike at 10 AM."

### 📜 **Log Explorer** (`/log-explorer`)

**The Forensic Investigator.**

- Deep-dives into Cloud Logging.
- Traces request lifecycles and finds root causes in text-based signals.
- **Use for:** "Find the stack trace for request ID X", "Show me recent errors in the payment-service."

### 📈 **Metric Analyst** (`/metric-analyst`)

**The Data Scientist.**

- Analyzes Cloud Monitoring metrics and dashboards.
- Identifies resource saturation, performance trends, and anomalies.
- **Use for:** "Is the CPU usage high?", "Compare latency today vs. yesterday."

### 🛡️ **Error Guardian** (`/error-guardian`)

**The Triage Nurse.**

- Monitors Cloud Error Reporting.
- Identifies top crashing groups, new anomalies, and impact scope.
- **Use for:** "What are the top errors right now?", "Did the last deployment introduce new crashes?"

## 🛠️ Prerequisites

Before using this plugin, ensure you have the following tools installed and configured:

1. **Google Cloud SDK (`gcloud`)**
   - Install instructions: [https://cloud.google.com/sdk/docs/install](https://cloud.google.com/sdk/docs/install)
   - Verify installation: `gcloud --version`

2. **Authentication**
   - The plugin uses your local `gcloud` credentials.
   - Login: `gcloud auth login`
   - (Optional) Application Default Credentials: `gcloud auth application-default login`

3. **Active Project**
   - Set your target project: `gcloud config set project YOUR_PROJECT_ID`

## 📦 Installation

### From Source (Local Development)

1. **Clone the repository**:

   ```bash
   git clone https://github.com/your-username/google-cloud-observability-plugin.git
   cd google-cloud-observability-plugin
   ```

2. **Run Claude Code with the plugin directory**:

   ```bash
   claude --plugin-dir .
   ```

3. **Verify Installation**:
   In Claude Code, type `/help` and check for the agents listed above.

## 🛡️ Safety & Security

This plugin is designed with **Safety First** principles:

- **Read-Only by Default**: The agents are optimized for _investigation_, not _modification_. They do not have permissions to delete resources or change configurations.
- **Scoped Access**: All `gcloud` commands are validated by a strict hook (`hooks/gcloud-validator.sh`) that enforces:
  - `--format=json` for reliable parsing.
  - `--limit=N` to prevent massive data dumps.
  - Project isolation rules.
- **Human in the Loop**: Any potentially destructive or ambiguous operation will prompt for user confirmation.

## 🧩 Architecture

The plugin uses a **Squad-based Agent Architecture**:

- **Agents**: High-level personas (defined in `agents/`) that reason about the data.
- **Skills**: Atomic tools (defined in `skills/`) that wrap specific `gcloud` CLI commands (e.g., `logging-read`, `monitoring-query`).
- **Hooks**: Safety middleware (defined in `hooks/`) that intercepts and validates tool usage before execution.

## 🤝 Contributing

Contributions are welcome! Please ensure:

1. New `gcloud` commands are added as **Skills**.
2. Safety rules are updated in `rules/gcloud-safety.md`.
3. Run `make test` (if available) to verify changes.

## 📄 License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

---

_Built for the [Claude Code](https://code.claude.com) ecosystem._
