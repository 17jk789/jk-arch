# my-vs-code-setting

This repository contains my personal **Visual Studio Code settings**.

> ⚠️ **Important:**
> This repo was not created for public distribution.
> It is intended only for my own use, so I can use my settings on another computer without logging into my GitHub account.

---

## Disclaimer

These settings are provided **as-is**, without any warranty.

I am **not responsible** for any issues, errors, or damage that may occur from using them, including but not limited to:

* configuration problems
* loss of data
* software issues
* compatibility problems

Use them **at your own risk**.

---

## License

This repository is primarily licensed under the **Apache License 2.0**.

Some files are distributed under different licenses:
- `general.lua` is licensed under **GNU General Public License v3.0-only (GPL-3.0-only)** because it contains modifications based on:
  https://github.com/end-4/dots-hyprland

---

## Notes

* Some settings may be system-specific (Windows vs Linux).
* Paths (e.g., Python interpreter) should be adjusted to your environment.
* This configuration is tailored to my personal workflow and may not suit everyone.

```json
{
    "editor.mouseWheelZoom": true,
    "python.defaultInterpreterPath": "...",
    "github.copilot.enable": {
        "*": false,
        "plaintext": false,
        "markdown": false,
        "scminput": false,
        "java": false
    },
    "gitlens.ai.model": "vscode",
    "gitlens.ai.vscode.model": "copilot:gpt-4.1",
    // New
    // Komfort & Editor-Visuals
    // "editor.mouseWheelZoom": true,
    "editor.cursorSmoothCaretAnimation": "on",
    "editor.smoothScrolling": true,
    // "editor.bracketPairColorization.enabled": true, // Seit VS Code 1.71+ ist das Standard
    "editor.guides.bracketPairs": true,
    // "editor.lineNumbers": "relative",
    "editor.occurrencesHighlight": "off",
    "editor.selectionHighlight": false,

    // Tabs & Indentation (nur Anzeige, keine automatische Änderung)
    "editor.tabSize": 4,
    "editor.insertSpaces": true,
    "editor.detectIndentation": true, // VS Code passt sich an bestehende Datei an

    // Dateien & Speicherung
    "files.insertFinalNewline": true,
    // "files.exclude": {
    //    "**/.git": true,
    //    "**/node_modules": true,
    //    "**/.DS_Store": true
    // },
    "files.autoSave": "off", // Kein automatisches Speichern, um ungewollte Änderungen zu vermeiden

    // Suche
    "search.smartCase": true,
    "workbench.editor.enablePreview": false,

    // Vim-Erweiterung (sicher, nur Anzeige & Navigation)
    "vim.useSystemClipboard": true,
    "vim.incsearch": true,
    "vim.hlsearch": true,
    "vim.visualstar": true,
    "vim.cursorStylePerMode": true,
    "vim.expandtab": true,
    "vim.tabstop": 4,
    "vim.shiftwidth": 4,
    "vim.softtabstop": 4,
    "vim.surround": true,
    "vim.commentary": true,
    "vim.remapKeys": true,
    "vim.jumpBackwards": true,
    // "vim.visualModeKeyBindingsNonRecursive": [],
    "vim.leader": "<space>",
    // "vim.recordMacroKey": "q",
    // "vim.repeatMacroKey": "@",
    "vim.recordMacroKey": null,
    "vim.repeatMacroKey": null,
    "vim.autoread": true,
    "vim.splitbelow": true,
    "vim.splitright": true,
    // "vim.handleKeys": {},
    "vim.useCtrlKeys": true,
    // "vim.smartRelativeLine": true,
    "vim.timeout": 500,
    "vim.colorcolumn": "80",
    "vim.showmatch": true,
    "vim.matchpairs": "(:),{:},[:],<:>",
    "vim.wrap": false,
    "vim.autowrite": false, // Kein automatisches Schreiben,
    "vim.handleKeys": {
        "<C-b>": false,
        "<C-j>": false,
        "u": false
    },
    "vim.normalModeKeyBindingsNonRecursive": [
        {
        "before": ["d"],
        "after": ["\"", "_", "d"]
        },
        {
        "before": ["d", "d"],
        "after": ["\"", "_", "d", "d"]
        }
    ],
    "vim.visualModeKeyBindingsNonRecursive": [
        {
            "before": ["d"],
            "after": ["\"", "_", "d"]
        }
    ],
    "vim.statusBarColorControl": true,
    // "vim.statusBarColors.normal": ["#78A4F1", "#ffffff"],
    // "vim.statusBarColors.insert": ["#BF616A", "#ffffff"],
    // "vim.statusBarColors.visual": ["#B48EAD", "#ffffff"],
    // "vim.statusBarColors.visualline": ["#B48EAD", "#ffffff"],
    // "vim.statusBarColors.visualblock": ["#A3BE8C", "#ffffff"],
    // "vim.statusBarColors.replace": ["#D08770", "#ffffff"],
    // "vim.statusBarColors.commandlineinprogress": ["#020408", "#ffffff"],
    // "vim.statusBarColors.searchinprogressmode": ["#020408", "#ffffff"],
    // "vim.statusBarColors.easymotionmode": ["#020408", "#ffffff"],
    // "vim.statusBarColors.easymotioninputmode": ["#020408", "#ffffff"],
    // "vim.statusBarColors.surroundinputmode": ["#020408", "#ffffff"],
    // Catppuccin Mocha
    "vim.statusBarColors.normal": ["#C5AAF1", "#11111b"],
    "vim.statusBarColors.insert": ["#89b4fa", "#11111b"],
    "vim.statusBarColors.visual": ["#a6e3a1", "#11111b"],
    "vim.statusBarColors.visualline": ["#b4befe", "#11111b"],
    "vim.statusBarColors.visualblock": ["#fab387", "#11111b"],
    "vim.statusBarColors.replace": ["#f38ba8", "#11111b"],
    "vim.statusBarColors.commandlineinprogress": ["#11111A", "#cdd6f4"],
    "vim.statusBarColors.searchinprogressmode": ["#11111A", "#cdd6f4"],
    "vim.statusBarColors.easymotionmode": ["#11111A", "#11111b"],
    "vim.statusBarColors.easymotioninputmode": ["#11111A", "#11111b"],
    "vim.statusBarColors.surroundinputmode": ["#11111A", "#11111b"],
    "editor.wordWrap": "off",
    "workbench.colorCustomizations": {
        "statusBar.background": "#89b4fa",
        "statusBar.noFolderBackground": "#89b4fa",
        "statusBar.debuggingBackground": "#89b4fa",
        "statusBar.foreground": "#11111b",
        "statusBar.debuggingForeground": "#11111b"
    },
    // Windows
    "vim.shell": "...",
    /* "vim.shellArgs": [
        "-NoLogo",
        "-NoProfile",
        "-Command"
    ], */
    "workbench.colorTheme": "Catppuccin Mocha",
    "workbench.activityBar.location": "top",
    "gitlens.ai.enabled": false,
    "workbench.sideBar.location": "right",
    "window.menuBarVisibility": "compact",
    "window.commandCenter": false,

    // Rust Analyzer
    "rust-analyzer.cargo.loadOutDirsFromCheck": true,
    "rust-analyzer.procMacro.enable": true,
    "rust-analyzer.checkOnSave": true,
    "rust-analyzer.checkOnSave.command": "clippy",
    // "rust-analyzer.checkOnSave.command": "check" // fatser
    "rust-analyzer.checkOnSave.extraArgs": ["--", "-W", "clippy::all"],
    "rust-analyzer.inlayHints.enable": true,
    "rust-analyzer.inlayHints.typeHints": true,
    "rust-analyzer.inlayHints.parameterHints": true,
    "rust-analyzer.lens.enable": true,
    "rust-analyzer.diagnostics.disabled": ["unresolved-proc-macro"],
    "rust-analyzer.server.extraEnv": {
        "RA_LRU_CAP": "100000"
    }
}
```
