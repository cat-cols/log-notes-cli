# log-notes-cli ⚡️

A minimalist, workspace-aware Zsh utility for generating structured Markdown documentation on the fly.

`log` eliminates the friction of manual file naming and organization, allowing you to document fixes, architectural decisions, or brainstorms without breaking your flow.

## 🚀 Why?
Context-switching is the enemy of productivity. I built `log` because I wanted to document my progress without:

1. **Leaving the terminal.**
2. **Thinking about where to save a file.**
3. **Manually creating timestamps or slugified filenames.**

## ✨ Features
* **Context-Aware:** Automatically detects your current project and creates a `_log/` directory.
* **Intelligent Naming:** Generates chronological filenames using `SECTION__YYYY-MM-DD__HHMMSS__SLUG.md`.
* **Auto-Slugify:** Cleans your titles into filesystem-friendly strings (lowercase, underscores).
* **Session Persistence:** Remembers the last "Section" you worked on for rapid-fire logging.
* **Deep Editor Integration:** Opens the new file instantly in **Windsurf** (default), VS Code, or your system editor.

---

## 📦 Installation

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/cat-cols/log-notes-cli.git](https://github.com/cat-cols/log-notes-cli.git) ~/.log-notes-cli
   ```

2. **Add to your `.zshrc`:**
   ```bash
   echo "source ~/.log-notes-cli/log.sh" >> ~/.zshrc
   ```

3. **Reload your shell:**
   ```bash
   source ~/.zshrc
   ```

---

## ⚙️ Configuration

You can customize `log` by setting environment variables in your `.zshrc`. If not set, the tool uses these defaults:

| Variable | Default Value | Description |
| --- | --- | --- |
| `LOG_EDITOR` | `Windsurf` | The application used to open logs on macOS.
| `LOG_DIR` | `./_log` | The directory where logs are saved relative to your current path.
| `EDITOR` | `nano` | Fallback editor used if you are not on macOS.
|

**Example customization:**

```bash
export LOG_EDITOR="Visual Studio Code"
export LOG_DIR="$HOME/Documents/DevLogs"
```

---

## ⌨️ Usage

Type `log` in any project directory to begin. It will prompt you for a **Section** (which persists for your current terminal session) and a **Log Title**.

---
