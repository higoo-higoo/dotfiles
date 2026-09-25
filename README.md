# dotfile

## chezmoi install

```shell
snap install chezmoi --classic // linux
brew install chezmoi // mac
```

## chezmoi init

```shell
chezmoi init git@github.com:higoo-higoo/dotfiles.git
```

## Pi のプロンプト入力

`dot_pi/agent/keybindings.json` を `~/.pi/agent/keybindings.json` として chezmoi で管理します。

- 改行: `Shift + Enter` / `Option + Enter` (`Alt + Enter`) / `Ctrl + J`
- 送信: `Enter`
- フォローアップ送信: `Ctrl + Q`（`Option + Enter` との競合を回避）
- 外部エディタ: `Ctrl + G`（標準のまま）

適用後、起動中の Pi では `/reload` を実行してください。
修飾付き Enter は端末が対応するキー情報を送信する必要があります。
端末や tmux の設定で認識されない場合は `Ctrl + J` を使えます。
認証情報やセッション履歴は管理対象に含めません。

## chsh

```
chsh -s /bin/zsh
```
