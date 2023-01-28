# README
## users テーブル

| Column             | Type   | Options                       |
| ------------------ | ------ | ----------------------------- |
| nickname           | string | null: false |
| encrypted_password | string | null: false                   |
| surname            | string | null: false                   |
| firstname          | string | null: false                   |
| surname_kana       | string | null: false                   |
| firstname_kana     | string | null: false                   |


### Association
- belongs_to :item
- has_one :buyer

## items テーブル

| Column      | Type       | Options                        |
| ----------  | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| price       | integer    | null: false                    |
| explanation | text       | null: false                    | 
| category    | string     | null: false                    |
| state       | string     | null: false                    |
| payee       | string     | null: false                    |
| sender      | string     | null: false                    |
| days        | string     | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- has_many :users


## buyer テーブル

| Column           | Type       | Options                     |
| ---------------- | ---------- | --------------------------- |
| postal_code      | integer    | null: false                 |
| municipality     | references | null: false                 |
| address          | integer    | null: false                 |
| building_name    | string     | null: true                  |
| telephone_number | integer    | null: false                 |
| prefecture       | string     | null: false                 |

### Association

- belongs_to : user