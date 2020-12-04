# コーヒー抽出レシピ投稿機能

## 開発環境
Ruby2.6.5/Ruby on Rails6.0.3.4/Mysql/git hub /Sequel Pro/AWS S3/heroku

### 実装機能

- ユーザー新機登録機能
- ユーザーログイン機能
- ユーザープロフィール機能
- DM機能
- 投稿機能
- 投げ銭機能（PAYjp　API）
- コメント機能
- チャット機能
- 投稿一覧表示機能
- ユーザーマッチング機能
- 投稿時画像プレビュー機能
- S3への画像保存


## テーブル設計

### usersテーブル

| Column              | Type   | Option----- |
|---------------------|--------|-------------|
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| first_name          | string | null: false |
| last_name           | string | null: false |
| first_ruby          | string | null: false |
| last_ruby           | string | null: false |
| birthday            | date   | null: false |

### Association

- has_one :profile
- has_many :ideas
- has_many :orders
- has_one :addresses
- has_many :comment
- has_many :massages
- has_many :room_user
- has_many :rooms, through: room_user

### profilesテーブル

| Column | Type     | Option  |
|--------|----------|---------|
| free   | text     |         |

- belongs_to :user


### ideasテーブル

| Column      | Type        | Option                         |
|-------------|-------------|--------------------------------|
| title       | string      | null: false                    |
| text        | string      | null: false                    |
| category_id | integer     | null: false                    |
| user        | references  | null: false,foreign_key: true  |

### Association

- belongs_to :user
- has_one :order
- has_many :comments


### ordersテーブル

| Column      | Type       | Option                         |
|-------------|------------|--------------------------------|
| user   　　　| references | null: false,foreign_key: true  |
| idea   　　　| references | null: false,foreign_key: true  |
| price       | integer    | null: false                    |

### Association

- belongs_to :idea
- belongs_to :user

### commentsテーブル

| Column  | Type       | Option                         |
|---------|------------|--------------------------------|
| text    | string     | null: false                    |
| user    | references | null: false,foreign_key: true  |
| idea    | references | null: false,foreign_key: true  |

### Association

- belongs_to :idea
- belongs_to :user

### roomsテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

### room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

### messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

