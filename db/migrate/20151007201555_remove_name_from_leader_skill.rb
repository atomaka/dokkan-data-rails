class RemoveNameFromLeaderSkill < ActiveRecord::Migration
  def change
    remove_column :leader_skills, :name
  end
end
