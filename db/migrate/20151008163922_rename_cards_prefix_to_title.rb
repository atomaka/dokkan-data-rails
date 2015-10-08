class RenameCardsPrefixToTitle < ActiveRecord::Migration
  def change
    rename_column :cards, :prefix, :title
  end
end
