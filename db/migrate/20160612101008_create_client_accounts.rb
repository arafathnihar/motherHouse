class CreateClientAccounts < ActiveRecord::Migration
  def change
    create_table :client_accounts do |t|
      # front ends' view level
      t.integer :clientId, null: false
      t.decimal :amount, null: false # monitory value of each transaction (in CHF)
      t.datetime :date, null: false # date of transaction
      t.integer :bDownStatus, null: false, default: 1 # brought down status # default, not bDown

      # database and coding level
      t.string :guid, null: false
      t.integer :status, null: false, default: 1 # default: not deleted
      t.integer :created_by, null: false
      t.integer :updated_by, null: true

      t.timestamps null: true
    end

    # references (from_table, to_table, options = {})
    add_foreign_key :client_accounts, :clients, column: :clientId

    add_foreign_key :client_accounts, :users, column: :created_by
    add_foreign_key :client_accounts, :users, column: :updated_by
  end
end
