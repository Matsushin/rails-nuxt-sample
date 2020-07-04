## 概要
- Nuxt.js x Railsのサンプルアプリです。RailsはAPIとして利用しています。
- タスク一覧/登録/編集/削除のみできます。

### API
- タスク
  - 一覧
  - 登録
  - 詳細
  - 更新
  - 削除

## 環境
### Version
- Ruby v2.6.3
- Rails v6.0.3.2
- MySQL 5.7.22
- Nuxt.js v2.13.3
- Vuetify v2.3.3

### アプリ初期設定
```
$ make init
```

## 起動・終了

### 起動コマンド

以下のコマンドで起動します。

```
$ make up
```

### 確認

- フロント側：http://localhost:3000/tasks
- API側：http://localhost:8080/api/v1/tasks

### 終了
Ctrl+C
