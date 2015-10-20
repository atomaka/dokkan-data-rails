class CreateStatTypes < ActiveRecord::Migration
  def change
    create_table :stat_types do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
