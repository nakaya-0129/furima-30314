# FURIMA-30314


# テーブル設計


##  users テーブル



| Column              | Type   | Options                             |
| ------------------- | ------ | ----------------------------------- |
| nick_name           | string | null: false                         | 
| email               | string | null: false, unique: true           | 
| encrypted_password  | string | null: false                         | 
| surname             | string | null: false                         |
| first_name          | string | null: false                         |
| surname_kana        | string | null: false                         |
| first_name_kana     | string | null: false                         | 
| birthday            | date   | null: false                         |


##  Association


has_many :items
belongs_to :purchase


##  items テーブル


| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | string     | null: false                    | 
| item_description  | text       | null: false                    |
| item_status       | string     | null: false                    |
| image             | text       | null: false                    |
| category          | string     | null: false                    | 
| price             | integer    | null: false                    | 
| user              | references | null: false, foreign_key:true  |


##  Associationbe

belongs_to :user
hsa_one    :purchase


##  purchases  テーブル


| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| user            | references  | null: false, foreign_key:true  | 
| item            | references  | null: false, foreign_key:true  | 


##  Association

belongs_to :user
belongs_to :item


##  address テーブル


| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| postal_code     | string      | null: false                    | 
| prefectures     | string      | null: false                    | 
| municipal       | string      | null: false                    | 
| house_number    | string      | null: false                    | 
| building        | string      |                                |
| phone_number    | integer     | null: false                    |


##  Association


belongs_to :purchase


## shipping テーブル


| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| shipping_cost   | integer    | null: false                    |
| ship_days       | integer    | null: false                    |
| consignor       | string     | null: false                    |


## Association

belongs_to :item