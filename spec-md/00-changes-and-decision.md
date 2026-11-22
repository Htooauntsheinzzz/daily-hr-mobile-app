# Daily HR changes and decisions

Append dated entries in chronological order. When a later decision replaces an earlier one, refer to its date and topic so the history stays readable.

## 2026-11-22 — Mobile project setup

- **Decision** — Use the existing Flutter application and its Android and iOS runners for Daily HR.
- **Reason** — Both mobile platforms share the employee and HR workflows described in the [agent guide](../Agent.md).
- **Change** — Added agent instructions and this log, replaced the starter README with mobile setup steps, and extended Git ignore rules for local configuration and signing material.
- **Verification** — Inspected the Dart entry point, widget test, Android manifest, and iOS workspace. The app currently contains the starter counter.
- **Open** — Backend provider selection and the first Daily HR feature implementation.

## Template for future entries

Copy this block under a new dated heading.

```markdown
## YYYY-MM-DD — Short title

- **Change** — What changed and which workflows or platforms it affects.
- **Decision and reason** — What was chosen and why.
- **Verification** — Commands, device checks, and results.
- **Open** — Any remaining work or unresolved question.
```

## 2026-11-22 — Shared asset folders

Registered `assets/`, `assets/images/`, `assets/icons/`, and `assets/logos/` for both mobile targets so new files placed directly in those folders are picked up on the next build. Parsed the manifest and verified that every declared folder exists.
