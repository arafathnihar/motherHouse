class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      # front ends' view level
      t.string :customId, limit: 12, null: false, unique: true
      t.integer :mainAgentId, null: false
      t.string :name, null: false
      t.string :contact, limit: 15, null: true
      t.integer :countryId, null: true

      # database and coding level
      t.string :guid, null: false
      t.integer :status, null: false, default: 1 # default: not deleted
      t.integer :created_by, null: false
      t.integer :updated_by, null: true

      t.timestamps null: true
    end

    # references (from_table, to_table, options = {})
    add_foreign_key :agents, :main_agents, column: :mainAgentId

    add_foreign_key :agents, :countries, column: :countryId

    add_foreign_key :agents, :users, column: :created_by
    add_foreign_key :agents, :users, column: :updated_by
  end
end
