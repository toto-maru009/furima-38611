# README
## users テーブル

| Column             | Type   | Options                       |
| ------------------ | ------ | ----------------------------- |
| nickname           | string | null: false                   |
| email              | string | null: false
| encrypted_password | string | null: false                   |
| surname            | string | null: false                   |
| firstname          | string | null: false                   |
| surname_kana       | string | null: false                   |
| firstname_kana     | string | null: false                   |


### Association
- has_many :items
- has_many :purchase

## items テーブル

| Column      | Type       | Options                        |
| ----------  | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| price       | integer    | null: false                    |
| explanation | text       | null: false                    | 
| category_id | integer    | null: false                    |
| status_id   | integer    | null: false                    |
| payee_id    | integer    | null: false                    |
| sender_id   | integer    | null: false                    |
| day_id      | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true |

### Association

- belong_to :user
- has_one :purchase


## buyer テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | integer    | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     | null: true                     |
| telephone_number | string     | null: false                    |
| sender_id        | integer    | null: false                    |
| purchase_id      | integer    | null: false, foreign_key: true |
### Association

- belong_to :purchase

## purchase テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true | 

### Association

- belong_to :item
- has_one :buyer
- belong_to :user
