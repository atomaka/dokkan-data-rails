class CreateRarities < ActiveRecord::Migration
  def change
    create_table :rarities do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
