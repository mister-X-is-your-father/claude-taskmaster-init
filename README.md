# claude-taskmaster-init

Claude Code + TaskMaster用のプロジェクト初期化スクリプト

## インストール

### Linux / macOS / WSL

```bash
curl -fsSL https://raw.githubusercontent.com/mister-X-is-your-father/claude-taskmaster-init/master/install.sh | bash
```

### Windows (PowerShell)

```powershell
irm https://raw.githubusercontent.com/mister-X-is-your-father/claude-taskmaster-init/master/install.ps1 | iex
```

### 手動インストール

```bash
# ダウンロード
mkdir -p ~/bin
curl -o ~/bin/new-project https://raw.githubusercontent.com/mister-X-is-your-father/claude-taskmaster-init/master/new-project
chmod +x ~/bin/new-project

# PATHに追加（~/.bashrc または ~/.zshrc）
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

## 使い方

```bash
new-project my-awesome-app
```

または対話モード:

```bash
new-project
# Project name: と聞かれるので入力
```

## 作成されるファイル

```
my-awesome-app/
├── .git/                  # Git初期化済み
├── .taskmaster/
│   ├── config.json        # TaskMaster設定（Anthropic使用）
│   ├── docs/
│   │   └── prd.txt        # PRDテンプレート
│   └── tasks/
│       └── tasks.json     # タスク管理ファイル
├── CLAUDE.md              # Claude Code用プロジェクト説明
└── .gitignore
```

## ワークフロー

1. `new-project my-app` でプロジェクト作成
2. `.taskmaster/docs/prd.txt` を編集して要件を書く
3. Claude Codeを起動: `claude -c --dangerously-skip-permissions`
4. 「PRDをパースしてタスクを作成して」と依頼
5. タスクに沿って開発

## TaskMaster MCP設定

Claude CodeでTaskMasterを使うには:

```bash
# APIキー不要の設定（Claude Codeの内蔵モデルを使用）
claude mcp add-json "taskmaster-ai" '{"command":"npx","args":["-y","task-master-ai"],"env":{"MODEL":"claude-code"}}'
```

## GUI（オプション）

```bash
npx task-studio
```

Web UIでタスクをKanbanボード形式で管理できる。

## 必要なもの

- [Claude Code](https://claude.ai/code)
- Git
- (オプション) [TaskMaster AI MCP](https://github.com/eyaltoledano/claude-task-master)

## アンインストール

```bash
rm ~/bin/new-project
# ~/.bashrc から PATH行を削除
```

## License

MIT
