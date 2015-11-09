class AddCostStatToCard < ActiveRecord::Migration
  def self.up
    add_column :cards, :cost_stat_id, :integer

    PaperTrail.whodunnit = 1
    Card.all.each do |c|
      c.cost_stat = Stat.new(stat_type_id: 4)
      c.save
    end
  end

  def self.down
    remove_column :cards, :cost_stat_id
  end
end
