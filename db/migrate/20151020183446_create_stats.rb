class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :min
      t.integer :max
      t.integer :awaken_min
      t.integer :awaken_make
      t.references :stat_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
