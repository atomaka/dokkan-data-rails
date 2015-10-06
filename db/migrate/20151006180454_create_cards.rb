class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.references :character, index: true, foreign_key: true
      t.references :rarity, index: true, foreign_key: true
      t.references :type, index: true, foreign_key: true
      t.references :leader_skill, index: true, foreign_key: true
      t.references :passive_skill, index: true, foreign_key: true
      t.references :super_attack, index: true, foreign_key: true
      t.integer :dokkan_id, index: true, foreign_key: true
      t.string :suffix
      t.string :gameid

      t.timestamps null: false
    end
  end
end
