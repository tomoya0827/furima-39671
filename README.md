## users

|Column             |Type  |Options    |
|nickname           |string|null: false|
|email              |string|null: false|
|encrypted_password |string|null: false|
|first_name         |string|null: false|
|family_name        |string|null: false|
|first_name_kana    |string|null: false|
|family_name_kana   |string|null: false|
|birth_day          |date  |null: false|

### Association

has_many :products
has_many :purchase_records


## products

|Column              |Type      |Options                       |
|image               |string    |null: false                   |
|product_name        |string    |null: false                   |
|description         |text      |null: false                   |
|category            |string    |null: false                   |
|condition           |string    |null: false                   |
|cost                |string    |null: false                   |
|region              |string    |null: false                   |
|days                |string    |null: false                   |
|price               |string    |null: false                   |
|product_id          |integer   |null: false, foreign_key: true|
|user_id             |references|null: false, foreign_key: true|

### Association

belongs_to :user
has_one :purchase_record
has_one :shipping_address


## shipping_address

|Column             |Type      |Options                       |
|post_code          |string    |null: false                   |
|prefecture         |string    |null: false                   |
|city               |string    |null: false                   |
|address            |string    |null: false                   |
|phone_name         |string    |null: false                   |
|user_id            |references|null: false, foreign_key: true|

### Association

belongs_to :product
has_one :purchase_record


## purchase_records

|Column             |Type|Options                             |
|product_id         |integer   |null: false, foreign_key: true|
|user_id            |references|null: false, foreign_key: true|

### Association

belongs_to :user
belongs_to :product
belongs_to :shipping_address