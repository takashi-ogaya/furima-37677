## items table
| Column                | Type              | Option                         |
| --------------------- | ----------------- | ------------------------------ |
| trade_name            | string            | null: false                    |
| category_id           | integer           | null: false                    |
| condition_id          | integer           | null: false                    |
| postage_id            | integer           | null: false                    |
| prefecture_id         | integer           | null: false                    |
| shipping_days_id      | integer           | null: false                    |
| detail                | text              | null: false                    |
| price                 | integer           | null: false                    |
| user                  | references        | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase


## users table
| Column                | Type              | Option                         |
| --------------------- | ----------------- | ------------------------------ |
| nickname              | string            | null: false                    |
| email                 | string            | null: false, uniqueness: true  |
| encrypted_password    | string            | null: false                    |
| last_name             | string            | null: false                    |
| first_name            | string            | null: false                    |
| last_name_kana        | string            | null: false                    |
| first_name_kana       | string            | null: false                    |
| birthday              | date              | null: false                    |

### Association
- has_many :items
- has_many :purchases


## addresses table
| Column                | Type              | Option                         |
| --------------------- | ----------------- | ------------------------------ |
| post_code             | string            | null: false                    |
| prefecture_id         | integer           | null: false                    |
| municipality          | string            | null: false                    |
| block                 | string            | null: false                    |
| building_name         | string            |                                |
| phone_number          | string            | null: false                    |
| purchase              | references        | null: false, foreign_key: true |

### Association
- belongs_to :purchase


## purchases　table
| Column                | Type              | Option                         |
| --------------------- | ----------------- | ------------------------------ |
| user                  | references        | null: false, foreign_key: true |
| item                  | references        | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :address
- belongs_to :item