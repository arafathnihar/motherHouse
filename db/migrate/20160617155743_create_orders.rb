class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      # front ends' view level
      t.string :customId, limit: 12, null: false, unique: true
      t.integer :agentId, null: false
      t.integer :receivingAgentId, null: false
      t.integer :receiverId, null: false
      t.decimal :orderAmount, null: false # amount to be supplied
      t.integer :orderCurrId, null: false # currency of amount to be supplied
      t.integer :supplyCurrId, null: false # currency in which to make the supply
      t.decimal :exchangeRate, null: false # exchange rate of currency to be supplied
      t.datetime :date, null: false # date of order
      t.integer :orderStatus, null: false, default: 1 # order status # default, not supplied

      # database and coding level
      t.string :guid, null: false
      t.integer :status, null: false, default: 1 # default: not deleted
      t.integer :created_by, null: false
      t.integer :updated_by, null: true

      t.timestamps null: true
    end

    # references (from_table, to_table, options = {})
    add_foreign_key :orders, :agents, column: :agentId
    add_foreign_key :orders, :receiving_agents, column: :receivingAgentId
    add_foreign_key :orders, :receivers, column: :receiverId

    add_foreign_key :orders, :currencies, column: :orderCurrId
    add_foreign_key :orders, :currencies, column: :supplyCurrId

    add_foreign_key :orders, :users, column: :created_by
    add_foreign_key :orders, :users, column: :updated_by
  end
end
