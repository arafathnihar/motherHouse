class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      # front ends' view level
      t.string :customId, limit: 12, null: false, unique: true
      t.integer :agent_id, null: false
      t.integer :receiving_agent_id, null: false
      t.integer :receiver_id, null: false
      t.decimal :orderAmount, null: false # amount to be supplied
      t.integer :order_curr_id, null: false # currency of amount to be supplied
      t.integer :supply_curr_id, null: false # currency in which to make the supply
      t.decimal :exchangeRate, null: false # exchange rate of currency to be supplied
      t.datetime :orderDate, null: false
      t.integer :orderStatus, null: false, default: 1 # order status # default, not supplied
      #t.datetime :suppliedDate, null: false
      #t.datetime :completedDate, null: false
      t.string :comments, null: true

      # database and coding level
      t.string :guid, null: false
      t.integer :status, null: false, default: 1 # default: not deleted
      t.integer :created_by, null: false
      t.integer :updated_by, null: true

      t.timestamps null: true
    end

    # references (from_table, to_table, options = {})
    add_foreign_key :orders, :agents, column: :agent_id
    add_foreign_key :orders, :receiving_agents, column: :receiving_agent_id
    add_foreign_key :orders, :receivers, column: :receiver_id

    add_foreign_key :orders, :currencies, column: :order_curr_id
    add_foreign_key :orders, :currencies, column: :supply_curr_id

    add_foreign_key :orders, :users, column: :created_by
    add_foreign_key :orders, :users, column: :updated_by

    # this foreign key adds to mother_accounts table
    add_foreign_key :mother_accounts, :orders, column: :order_id
  end
end
