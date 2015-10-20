class AddVerifiedToCards < ActiveRecord::Migration
  def change
    add_column :cards, :verified, :boolean, default: false
  end
end
