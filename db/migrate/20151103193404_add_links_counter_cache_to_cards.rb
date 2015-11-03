class AddLinksCounterCacheToCards < ActiveRecord::Migration
  def up
    add_column :cards, :links_count, :integer, default: 0, null: false

    PaperTrail.whodunnit = 1
    Card.reset_column_information
    Card.find_each do |card|
      card.update_attribute(:links_count, card.links.count)
    end
  end

  def down
    remove_column :cards, :links_count
  end
end
