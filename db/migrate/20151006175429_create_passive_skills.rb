class CreatePassiveSkills < ActiveRecord::Migration
  def change
    create_table :passive_skills do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
