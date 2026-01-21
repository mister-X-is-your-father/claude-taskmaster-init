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
mkdir -p ~/bin
curl -o ~/bin/new-project https://raw.githubusercontent.com/mister-X-is-your-father/claude-taskmaster-init/master/new-project
chmod +x ~/bin/new-project
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

## 使い方

```bash
new-project my-awesome-app
```

## 作成されるファイル

```
my-awesome-app/
├── .taskmaster/
│   ├── config.json        # TaskMaster設定
│   ├── docs/prd.txt       # PRDテンプレート
│   └── tasks/tasks.json   # タスク管理ファイル
├── CLAUDE.md              # プロジェクト説明
└── .gitignore
```

---

## TaskMaster MCP設定

Claude CodeでTaskMasterを使うには:

```bash
# APIキー不要（Claude Codeの内蔵モデルを使用）
claude mcp add-json "taskmaster-ai" '{"command":"npx","args":["-y","task-master-ai"],"env":{"MODEL":"claude-code"}}'
```

設定後、Claude Codeを再起動。

---

## タスクの確認方法

### 1. Web GUI（Task Studio）

```bash
cd my-app
npx task-studio
```

ブラウザで `http://localhost:5173` が開き、Kanbanボードでタスク管理できる。

### 2. VS Code拡張

[Taskmaster AI - VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=Hamster.task-master-hamster)

VS Code内でタスクを視覚的に管理。

### 3. コマンドライン

```bash
# タスク一覧
npx task-master-ai list

# 次のタスク
npx task-master-ai next

# 特定タスク詳細
npx task-master-ai show 1
```

### 4. 直接ファイル編集

`.taskmaster/tasks/tasks.json` を直接編集可能:

```json
{
  "tasks": [
    {
      "id": "1",
      "title": "ログイン機能実装",
      "description": "OAuth2.0でGoogleログイン",
      "status": "pending",
      "priority": "high",
      "dependencies": [],
      "subtasks": []
    }
  ]
}
```

**ステータス値**: `pending`, `in-progress`, `done`, `blocked`, `deferred`, `cancelled`

---

## タスクの操作方法

### AIにタスクを作成させる（Claude Code内）

```
PRDをパースしてタスクを作成して
```

```
タスク1を5つのサブタスクに分解して
```

```
次のタスクは何？
```

### AIにタスクを更新させる

```
タスク1を完了にして
```

```
タスク2のステータスをin-progressにして
```

```
新しいタスク「テスト作成」を追加して
```

### 手動でタスク確認・編集

| 方法 | コマンド/操作 |
|------|--------------|
| GUI | `npx task-studio` |
| CLI一覧 | `npx task-master-ai list` |
| CLI詳細 | `npx task-master-ai show <id>` |
| ファイル直接 | `.taskmaster/tasks/tasks.json` を編集 |
| VS Code | 拡張機能インストール後、サイドバーから |

### ステータス変更（CLI）

```bash
npx task-master-ai set-status --id 1 --status done
npx task-master-ai set-status --id 2 --status in-progress
```

---

## ワークフロー例

```
1. new-project my-app          # プロジェクト作成
2. vim .taskmaster/docs/prd.txt # PRD編集
3. claude -c                    # Claude Code起動
4. 「PRDパースして」            # タスク自動生成
5. npx task-studio              # GUIで確認
6. 「次のタスクやって」         # 開発開始
7. 「タスク1完了」              # 完了マーク
```

---

## 必要なもの

- [Claude Code](https://claude.ai/code)
- Git
- Node.js（npx用）

## License

MIT
