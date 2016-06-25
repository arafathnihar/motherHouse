class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      # for api token storing
      t.string :access_token, null: false, unique: true
      t.integer :user_id, null: false

      t.datetime :created_at, null: true
      t.datetime :expires_at, null: true
      t.boolean :status, null: false
    end

    add_foreign_key :api_keys, :users, column: :user_id
  end
end
