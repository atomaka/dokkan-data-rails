class AddStatsToCards < ActiveRecord::Migration
  def change
    add_column :cards, :hp_stat_id, :integer
    add_column :cards, :atk_stat_id, :integer
    add_column :cards, :def_stat_id, :integer
  end
end
