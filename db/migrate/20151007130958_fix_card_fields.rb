class FixCardFields < ActiveRecord::Migration
  def change
    change_column :cards, :gameid, :string, default: '0000000'
    rename_column :cards, :suffix, :prefix
  end
end
