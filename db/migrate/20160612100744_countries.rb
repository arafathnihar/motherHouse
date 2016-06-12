class Countries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      # populated via a seeder
      t.string :code, limit: 5, null: false, unique: true
      t.string :name, limit: 100, null: false
    end
  end
end
