# テーブル設計


## usersテーブル

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

## profilesテーブル

| Column | Type     | Option
|-------------------|---------
| job    | string   |
| hobby  | string   |
| sex_id | integer  |
| skill  | string   |
| area_id| integer  |
| free   | text     |

- belongs_to :user


## ideasテーブル

| Column      | Type        | Option                         |
|-------------|-------------|--------------------------------|
| title       | string      | null: false                    |
| text        | string      | null: false                    |
| category_id | integer     | null: false                    |
| format_id   | integer     | null: false                    |
| price       | integer     | null: false                    |
| user        | references  | null: false,foreign_key: true  |

### Association

- belongs_to :user
- has_one :order
- has_many :comments


## ordersテーブル

| Column | Type       | Option                         |
|--------|------------|--------------------------------|
| user   | references | null: false,foreign_key: true  |
| idea   | references | null: false,foreign_key: true  |

### Association

- belongs_to :idea
- belongs_to :user

## commentsテーブル

| Column  | Type       | Option                         |
|---------|------------|--------------------------------|
| text    | string     | null: false                    |
| user    | references | null: false,foreign_key: true  |
| idea    | references | null: false,foreign_key: true  |

### Association

- belongs_to :idea
- belongs_to :user

## roomsテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

