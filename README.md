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
| name              | string     | null: false                    | 
| description       | text       | null: false                    |
| status            | integer    | null: false                    |
| category          | integer    | null: false                    | 
| price             | integer    | null: false                    | 
| shipping_cost     | integer    | null: false                    |
| ship_days         | integer    | null: false                    |
| shipping_area     | integer    | null: false                    |
| user              | string     | null: false                    |


##  Associationbe

belongs_to :user
hsa_one    :purchase


##  purchases  テーブル


| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| item            | references  | null: false, foreign_key:true  |
| user            | string      | null: false, foreign_key:true  | 


##  Association

belongs_to :user
belongs_to :item
has_one :address


##  address テーブル


| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| postal_code     | string      | null: false                    | 
| prefectures     | integer     | null: false                    | 
| municipal       | integer     | null: false                    | 
| house_number    | integer     | null: false                    | 
| building        | string      |                                |
| phone_number    | integer     | null: false                    |
| purchases_user  | references  | null: false                    |

##  Association

belongs_to :purchase


