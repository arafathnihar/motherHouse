class CreateMotherAccounts < ActiveRecord::Migration
  def change
    create_table :mother_accounts do |t|
      # front ends' view level
      t.integer :main_agent_id, null: false
      t.integer :agent_id, null: false
      t.integer :order_id, null: true
      t.decimal :drAmount, null: true, :precision => 16, :scale => 2 # monitory value of each debit transaction (in CHF)
      t.decimal :crAmount, null: true, :precision => 16, :scale => 2 # monitory value of each credit transaction (in CHF)
      t.decimal :cumulation, null: false, :precision => 16, :scale => 2 # cumulation monitory value of each transaction (in CHF)
      t.datetime :date, null: false # date of transaction
      t.integer :bDownStatus, null: false, default: 1 # brought down status # default, not bDown
      t.integer :nullify_id, null: true # nullified record
      t.boolean :isNullified, null: false, default: false
      t.integer :currency_id, null: true, default: 1

      # database and coding level
      t.string :guid, null: false
      t.integer :status, null: false, default: 1 # default: not deleted
      t.integer :created_by, null: false
      t.integer :updated_by, null: true

      t.timestamps null: true
    end

    # references (from_table, to_table, options = {})
    add_foreign_key :mother_accounts, :main_agents, column: :main_agent_id
    # foreign key for agent is in create_agent migration
    # foreign key for order is in create_order migration
    add_foreign_key :mother_accounts, :mother_accounts, column: :nullify_id
    add_foreign_key :mother_accounts, :currencies, column: :currency_id

    add_foreign_key :mother_accounts, :users, column: :created_by
    add_foreign_key :mother_accounts, :users, column: :updated_by
  end
end
