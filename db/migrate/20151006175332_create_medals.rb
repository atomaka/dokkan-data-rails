class CreateMedals < ActiveRecord::Migration
  def change
    create_table :medals do |t|
      t.string :name
      t.text :location

      t.timestamps null: false
    end
  end
end
