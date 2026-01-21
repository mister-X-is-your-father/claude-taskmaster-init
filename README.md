# new-project

Claude Code + TaskMaster用のプロジェクト初期化スクリプト

## インストール

```bash
curl -o ~/bin/new-project https://raw.githubusercontent.com/mister-x-is-your-father/new-project/main/new-project
chmod +x ~/bin/new-project
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
├── .taskmaster/
│   ├── config.json        # TaskMaster設定
│   ├── docs/
│   │   └── prd.txt        # PRDテンプレート
│   └── tasks/
│       └── tasks.json     # タスク管理ファイル
├── CLAUDE.md              # Claude Code用プロジェクト説明
└── .gitignore
```

## 次のステップ

1. `.taskmaster/docs/prd.txt` を編集して要件を書く
2. `make claude プロジェクト名` でClaude Codeを起動
3. 「PRDをパースしてタスクを作成して」と依頼

## 必要なもの

- [TaskMaster AI MCP](https://github.com/eyaltoledano/claude-task-master)
- Claude Code

## License

MIT
