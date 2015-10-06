class CreateLeaderSkills < ActiveRecord::Migration
  def change
    create_table :leader_skills do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
