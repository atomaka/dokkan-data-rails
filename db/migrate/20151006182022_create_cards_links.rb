class CreateCardsLinks < ActiveRecord::Migration
  def change
    create_join_table :cards, :links do |t|
      t.references :card, index: true, foreign_key: true
      t.references :link, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
