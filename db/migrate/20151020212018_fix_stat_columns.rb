class FixStatColumns < ActiveRecord::Migration
  def change
    rename_column :stats, :awaken_make, :awaken_max
  end
end
