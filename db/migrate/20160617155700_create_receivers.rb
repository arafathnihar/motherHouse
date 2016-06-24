class CreateReceivers < ActiveRecord::Migration
  def change
    create_table :receivers do |t|
      # front ends' view level
      t.string :name, null: false
      t.string :contact, limit: 15, null: true
      t.integer :countryId, null: true
      t.string :bankName, null: true
      t.string :branchName, null: true
      t.string :bankAcNo, null: true

      # database and coding level
      t.string :guid, null: false
      t.integer :status, null: false, default: 1 # default: not deleted
      t.integer :created_by, null: false
      t.integer :updated_by, null: true

      t.timestamps null: true
    end

    # references (from_table, to_table, options = {})
    add_foreign_key :receivers, :countries, column: :countryId

    add_foreign_key :receivers, :users, column: :created_by
    add_foreign_key :receivers, :users, column: :updated_by
  end
end
