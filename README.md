## users

|Column             |Type  |Options                  |
|nickname           |string|null: false              |
|email              |string|null: false, unique: true|
|encrypted_password |string|null: false              |
|first_name         |string|null: false              |
|family_name        |string|null: false              |
|first_name_kana    |string|null: false              |
|family_name_kana   |string|null: false              |
|birth_day          |date  |null: false              |

### Association

has_many :products
has_many :purchase_records


## products

|Column              |Type      |Options                       |
|product_name        |string    |null: false                   |
|description         |text      |null: false                   |
|category_id         |integer   |null: false                   |
|condition_id        |integer   |null: false                   |
|cost_id             |integer   |null: false                   |
|prefecture_id       |integer   |null: false                   |
|delivery_day_id     |integer   |null: false                   |
|price               |integer   |null: false                   |
|user                |references|null: false, foreign_key: true|

### Association

belongs_to :user
has_one :purchase_record


## shipping_addresses

|Column             |Type      |Options                       |
|post_code          |string    |null: false                   |
|prefecture_id      |integer   |null: false                   |
|city               |string    |null: false                   |
|address            |string    |null: false                   |
|building_name      |string    |                              |
|phone_name         |string    |null: false                   |
|purchase_record    |references|null: false, foreign_key: true|

### Association

belongs_to :purchase_record


## purchase_records

|Column             |Type|Options                             |
|product            |references|null: false, foreign_key: true|
|user               |references|null: false, foreign_key: true|

### Association

belongs_to :user
belongs_to :product
has_one :shipping_address