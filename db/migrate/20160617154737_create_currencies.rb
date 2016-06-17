class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      # populated via a seeder
      t.string :code, limit: 5, null: false, unique: true
      t.string :name, limit: 150, null: true
    end
  end
end
