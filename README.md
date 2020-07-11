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

## Vue.js(Nuxt.js)トレーニング
- ブランチを `start-training` に切り替えて課題1から順番に進めてください。

### 前提
- Rails側のコードは完成しているものとする。
- Nuxt側はコードは完成していないが必要なパッケージは導入済みの状態。
- 用意されたAPIのURL
  - タスク一覧
    - GET: `http://localhost:8080/api/v1/tasks`
  - タスク詳細
    - GET: `http://localhost:8080/api/v1/tasks/:id`
  - タスク登録
    - POST: `http://localhost:8080/api/v1/tasks`
  - タスク更新
    - PATCH: `http://localhost:8080/api/v1/tasks/:id`
  - タスク削除
    - DELETE: `http://localhost:8080/api/v1/tasks/:id`


### 課題1
### タスク詳細画面を固定データで表示する
- キャプチャと同様の見た目になるように詳細画面を作成してみよう
  - タスク情報はAPIは使わず`data`オプションの固定値として定義とする
  - 詳細画面の表示には[Vuetify](https://vuetifyjs.com/ja/)の[カード](https://vuetifyjs.com/ja/components/cards/#cards)を利用する
  - [ビューファイル](https://github.com/Matsushin/rails-nuxt-sample/blob/start-training/todo/pages/tasks/_id/index.vue)のみにコードを書くこと
- 実装例は[こちら](https://github.com/Matsushin/rails-nuxt-sample/pull/15)

#### 画面


### 課題2
### APIを利用してタスク情報を取得する
- タスク詳細APIを利用してタスク情報を取得してみよう
  - APIの呼び出しは`axios`を利用する
  - [ビューファイル](https://github.com/Matsushin/rails-nuxt-sample/blob/add-show/todo/pages/tasks/_id/index.vue)のみにコードを書くこと
  - ヒント
    - API呼び出しのタイミング`created`メソッド実行時
    - API呼び出し時は`await`を使って同期的に結果を取得して変数にセットする
- 実装例は[こちら](https://github.com/Matsushin/rails-nuxt-sample/pull/16)

### 課題3
#### APIの呼び出しを`store` から実行するように
- APIの呼び出しをビュー内からではなく`store`から呼び出すように変更してみよう
  - [ビューファイル](https://github.com/Matsushin/rails-nuxt-sample/blob/fetch-task-data/todo/pages/tasks/_id/index.vue)のコードを変更すること
  - [ストアファイル](https://github.com/Matsushin/rails-nuxt-sample/blob/fetch-task-data/todo/store/tasks.js)のコードを変更すること
  - ヒント
    - `mapGetter`

- 実装例は[こちら](https://github.com/Matsushin/rails-nuxt-sample/pull/17)

### 課題4
####  タスクを編集できるように
- キャプチャと同様の見た目になるように編集画面を作成してみよう
  - フォームは`Vuetify`の[フォーム](https://vuetifyjs.com/ja/components/forms/)を利用する
  - タスク一覧画面に編集ボタンを追加してクリックしたら編集画面に遷移すること
  - タスク更新APIを用いてタスクを更新できるように
    - 「この内容を編集する」ボタン押下時に更新APIが呼び出されること
  - 更新APIの結果がエラーだった場合はエラー文言が登録画面同様に表示されること
  - 更新APIの結果が成功だった場合は登録画面同様に一覧画面に遷移し「タスクを変更しました。」のトーストが表示されること

- 実装例は[こちら](https://github.com/Matsushin/rails-nuxt-sample/pull/18)

#### 画面


### 課題5
#### タスク登録と更新のフォームを共通化
- タスク登録と更新のフォーム部分をコンポーネント化して共通化してみよう
  - 見た目と動きは元と全く変わらないようにする
  - 新しくコンポーネントを作成する
    - ファイル名は`todo/components/tasks/TaskForm.vue`とする
  - クリックした際の動きは各ビューのメソッドを使うようにする
  - ヒント
    - `emit`

- 実装例は[こちら](https://github.com/Matsushin/rails-nuxt-sample/pull/19)
