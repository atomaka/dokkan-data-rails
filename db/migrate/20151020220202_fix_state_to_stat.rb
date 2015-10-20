class FixStateToStat < ActiveRecord::Migration
  def change
    rename_column :stats, :state_type_id, :stat_type_id
  end
end
