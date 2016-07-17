class CreateAgentAccounts < ActiveRecord::Migration
  def change
    create_table :agent_accounts do |t|
      # front ends' view level
      t.integer :agent_id, null: false
      t.integer :mother_ac_id, null: false
      t.decimal :drAmount, null: true # monitory value of each debit transaction (in CHF)
      t.decimal :crAmount, null: true # monitory value of each credit transaction (in CHF)
      t.decimal :cumulation, null: false # cumulation monitory value of each transaction (in CHF)
      t.datetime :date, null: false # date of transaction
      t.integer :bDownStatus, null: false, default: 1 # brought down status # default, not bDown
      t.integer :nullify_id, null: true # nullified record
      t.boolean :isNullified, null: false, default: false
      t.integer :currency_id, null: true, default: 1
      t.boolean :isPaid, null: false, default: false

      # database and coding level
      t.string :guid, null: false
      t.integer :status, null: false, default: 1 # default: not deleted
      t.integer :created_by, null: false
      t.integer :updated_by, null: true

      t.timestamps null: true
    end

    # references (from_table, to_table, options = {})
    add_foreign_key :agent_accounts, :agents, column: :agent_id
    add_foreign_key :agent_accounts, :mother_accounts, column: :mother_ac_id
    add_foreign_key :agent_accounts, :agent_accounts, column: :nullify_id
    add_foreign_key :agent_accounts, :currencies, column: :currency_id

    add_foreign_key :agent_accounts, :users, column: :created_by
    add_foreign_key :agent_accounts, :users, column: :updated_by
  end
end
