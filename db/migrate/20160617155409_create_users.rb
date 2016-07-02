class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # front ends' view level
      t.string :customId, limit: 12, null: false, unique: true
      t.string :name, null: false
      t.string :contact, limit: 15, null: true
      t.integer :country_id, null: true

      # credentials
      t.string :username, limit: 50, null: false, unique: true
      t.string :password, null: false

      # database and coding level
      t.string :guid, null: false
      t.integer :status, null: false, default: 1 # default: not deleted
      t.integer :created_by, null: false
      t.integer :updated_by, null: true

      t.timestamps null: true
    end

    # this is a part of users table only
    # references (from_table, to_table, options = {})
    add_foreign_key :users, :countries, column: :country_id
    add_foreign_key :users, :users, column: :created_by
    add_foreign_key :users, :users, column: :updated_by
  end
end
