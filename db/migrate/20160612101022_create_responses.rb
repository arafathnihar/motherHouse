class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      # front ends' view level
      t.integer :subAgentId, null: false
      t.integer :receiverId, null: false
      t.integer :requestId, null: false
      t.decimal :supplyAmount, null: false # amount should supply to receiver
      t.integer :supplyCurrId, null: false # currency type should supply to receiver
      t.datetime :date, null: false # date of response
      t.integer :responseStatus, null: false, default: 1 # response status # default, not supplied

      # database and coding level
      t.string :guid, null: false
      t.integer :status, null: false, default: 1 # default: not deleted
      t.integer :created_by, null: false
      t.integer :updated_by, null: true

      t.timestamps null: true
    end

    # references (from_table, to_table, options = {})
    add_foreign_key :responses, :sub_agents, column: :subAgentId
    add_foreign_key :responses, :receivers, column: :receiverId
    add_foreign_key :responses, :requests, column: :requestId
    add_foreign_key :responses, :currencies, column: :supplyCurrId

    add_foreign_key :responses, :users, column: :created_by
    add_foreign_key :responses, :users, column: :updated_by
  end
end
