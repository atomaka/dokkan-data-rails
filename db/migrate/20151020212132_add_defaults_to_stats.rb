class AddDefaultsToStats < ActiveRecord::Migration
  def change
    change_column :stats, :min, :integer, default: 0
    change_column :stats, :max, :integer, default: 0
    change_column :stats, :awaken_min, :integer, default: 0
    change_column :stats, :awaken_max, :integer, default: 0
  end
end
