class Link < ActiveRecord::Base
  has_and_belongs_to_many :cards

  validates :name, presence: true,
                   uniqueness: true

  default_scope { order(:name) }
end
