class Rarity < ActiveRecord::Base
  has_paper_trail

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
  validates :description, presence: true
end
