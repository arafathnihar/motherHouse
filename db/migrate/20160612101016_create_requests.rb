class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      # front ends' view level
      t.integer :clientId, null: false
      t.decimal :orderAmount, null: false # amount to be supplied
      t.integer :orderCurrId, null: false # currency of amount to be supplied
      t.integer :supplyCurrId, null: false # currency in which to make the supply
      t.decimal :exchangeRate, null: false # exchange rate of currency to be supplied
      t.datetime :date, null: false # date of request
      # t.integer :requestStatus, null: false, default: 1 # request status # default, not supplied

      # database and coding level
      t.string :guid, null: false
      t.integer :status, null: false, default: 1 # default: not deleted
      t.integer :created_by, null: false
      t.integer :updated_by, null: true

      t.timestamps null: true
    end

    # references (from_table, to_table, options = {})
    add_foreign_key :requests, :clients, column: :clientId
    add_foreign_key :requests, :currencies, column: :orderCurrId
    add_foreign_key :requests, :currencies, column: :supplyCurrId

    add_foreign_key :requests, :users, column: :created_by
    add_foreign_key :requests, :users, column: :updated_by
  end
end
