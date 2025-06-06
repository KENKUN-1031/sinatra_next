# 🚀 NextJS / Sinatra 環境 (Docker)

このレポジトリーは **Ruby + Sinatra + NextJS + PostgresSQL** を使った Web 開発環境だよ。

Docker を使うことで異なる技術を一括で管理できるようにしてる〜！

---

## 📦 主要技術スタック

- Ruby 3.0.0
- Sinatra (ruby のフレームワーク)
- ActiveRecord (db との通信に必要なライブラリ)
- React (フロントの言語)
- NextJS (react のフレームワーク)
- PostgresSQL (データベース)
- Docker

---

## 🔧 使い方！！

### 🐳 Docker を立ち上げる

まずはパソコンに Docker Desktop が入ってるかどうか確認してね〜！

次に以下のコードをターミナルで打ってください！！(プロジェクト直下)

```bash
docker-compose up --build
```

↑
docker 環境を立ち上げるためのコマンドだよ〜！

> ⭐️ これで環境が立ち上がるはず！

### 🥞 データベースの扱い方

まず！データベース用ののコマンドを使えるようにする！

**backend フォルダー** の中に移動して以下のコマンドを打ってね〜！

```bash
docker compose exec backend bash
psql -h db -U postgres -d mydatabase
```

↑
このコマンドでデータベースの中に入れるよ〜！

---

### **💡 コマンド一覧：※ここ大事！！**

- データベース内の全てのデーブル

  ```bash
  \dt
  ```

- テーブルの中身を見たい時 (users の部分を見たいテーブル名に変更する)

  ```bash
  select * from users;
  ```

- 新しいデータベースを作りたい時

  ```bash
  bundle exec rake db:create
  ```

- migration ファイルを作りたい時

  ```bash
  bundle exec rake db:create_migration NAME=create_users
  ```

- migration をしたい時
  ```bash
  bundle exec rake db:migrate:reset
  ```
