# Google Cloud Observability Plugin for Claude Code

A comprehensive plugin for [Claude Code](https://code.claude.com) that provides deep integration with Google Cloud Platform's observability stack. It enables Claude to safely investigate incidents, analyze metrics, and triage errors using specialized agents.

## 🚀 Capabilities

This plugin introduces a squad of specialized agents to handle different aspects of cloud observability. Each agent is accessible via a slash command.

### 🤖 **Cloud Pulse Orchestrator** (`/cloud-pulse-orchestrator`)

**The Mission Commander.**

- Acts as the primary interface for complex investigations.
- Coordinates specialists (Logs, Metrics, Errors) to build a holistic view of system health.
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

### 👋 **Say Hello Agent** (`/say-hello-agent`)

**The Connectivity Validator.**

- Simple agent to verify your GCP project context and authentication.
- **Use for:** "Say hello to my project."

## 🛠️ Prerequisites

Before using this plugin, ensure you have the following tools installed and configured:

1. **Claude Code** (Version 1.0.33 or later)
   - Install: `npm install -g @anthropic-ai/claude-code`

2. **Google Cloud SDK (`gcloud`)**
   - Install: [https://cloud.google.com/sdk/docs/install](https://cloud.google.com/sdk/docs/install)
   - Verify: `gcloud --version`

3. **Authentication**
   - The plugin uses your local `gcloud` credentials.
   - Login: `gcloud auth login`
   - (Optional) Application Default Credentials: `gcloud auth application-default login`

4. **Active Project**
   - Set your target project: `gcloud config set project YOUR_PROJECT_ID`

## 📦 Installation & Development

### Local Development (Recommended for testing)

1. **Clone the repository**:

   ```bash
   git clone https://github.com/yu-iskw/google-cloud-observability-plugin.git
   cd google-cloud-observability-plugin
   ```

2. **Run Claude Code with the plugin**:

   ```bash
   claude --plugin-dir .
   ```

   _This starts Claude Code with the local plugin directory loaded._

3. **Validate the Plugin**:

   ```bash
   claude plugin validate .
   ```

   _Ensures the manifest and structure follow the Claude Code plugin specification._

### Marketplace Installation (Coming Soon)

Once published, you can install the plugin via:

```bash
/plugin install google-cloud-observability
```

## 🛡️ Safety & Security

This plugin is designed with **Safety First** principles:

- **Read-Only by Default**: Agents are optimized for _investigation_, not _modification_. They do not have permissions to delete resources or change configurations.
- **Scoped Access**: All `gcloud` commands are validated by a strict hook (`hooks/gcloud-validator.sh`) that enforces:
  - `--format=json` for reliable parsing.
  - `--limit=N` to prevent massive data dumps.
  - Project isolation rules.
- **Human in the Loop**: Any potentially destructive or ambiguous operation will prompt for user confirmation.
- **Safety Rules**: Detailed guidelines are maintained in [rules/gcloud-safety.md](rules/gcloud-safety.md).

## 🧩 Architecture

The plugin uses a **Squad-based Agent Architecture**:

- **Agents**: High-level personas (defined in `agents/`) that reason about the data.
- **Skills**: Atomic tools (defined in `skills/`) that wrap specific `gcloud` CLI commands (e.g., `logging-read`, `monitoring-query`).
- **Hooks**: Safety middleware (defined in `hooks/`) that intercepts and validates tool usage before execution.

## 🤝 Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## 📄 License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

---

_Built for the [Claude Code](https://code.claude.com) ecosystem._
