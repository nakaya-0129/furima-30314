# FURIMA-30314


# テーブル設計


##  users テーブル



| Column              | Type   | Options                     |
| ------------------- | ------ | ----------------------------|
| nick_name           | string | null: false                 | 
| email               | string | null: false, unique: true   | 
| encrypted_password  | string | null: false                 | 
| surname             | string | null: false                 |
| first_name          | string | null: false                 |
| surname_kana        | string | null: false                 |
| first_name_kana     | string | null: false                 | 
| birthday            | date   | null: false                 |


##  Association


has_many :items
has_many :purchases


##  items テーブル


| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    | 
| description       | text       | null: false                    |
| price             | integer    | null: false                    | 
| status_id         | integer    | null: false                    |
| category_id       | integer    | null: false                    | 
| shipping_cost_id  | integer    | null: false                    |
| ship_days_id      | integer    | null: false                    |
| shipping_area_id  | integer    | null: false                    |
| user              | references | null: false, foreign_key:true  |


##  Associationbe

belongs_to :user
hsa_one    :order


##  orders  テーブル


| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| item            | references  | null: false, foreign_key:true  |
| user            | references  | null: false, foreign_key:true  | 


##  Association

belongs_to :user
belongs_to :item
has_one :address


##  address テーブル


| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| postal_code     | string      | null: false                    | 
| shipping_area_id  | integer     | null: false                    | 
| municipal       | string      | null: false                    | 
| house_number    | string      | null: false                    | 
| building        | string      |                                |
| phone_number    | string      | null: false                    |
| orders       | references  | null: false                    |

##  Association

belongs_to :orders


