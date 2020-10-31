# FURIMA-30314


# テーブル設計


##  users テーブル



| Column     | Type   | Options                   |
| ---------- | ------ | ------------------------  |
| nick_name  | string | null: false               | 
| email      | string | null: false, unique: true | 
| password   | string | null: false               | 
| user_name  | string | null: false               | 
| birthday   | date   | null: false                


##  Association


has_many :items
has_one  :purchases


##  items テーブル


| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| items_name | string     | null: false                    | 
| category   | string     | null: false                    | 
| price      | integer    | null: false                    | 
| user       | references | null: false, foreign_key:true  |


##  Associationbe

belongs_to :user
hsa_one    :purchases


##  purchases  テーブル


| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| address         | string      | null: false                    | 
| shipping_area   | string      | null: false                    | 
| shipping_days   | date        | null: false                    | 
| delivery_charge | integer     | null: false                    | 
| card_info       | string      | null: false                    | 
| user            | references  | null: false, foreign_key:true  |
| price           | references  | null: false, foreign_key:true  |

##  Association

belongs_to :user
belongs_to :items
