class AddVerifiedToCards < ActiveRecord::Migration
  def change
    add_column :cards, :verified, :bool, default: false
  end
end
