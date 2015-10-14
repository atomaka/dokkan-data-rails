class Character < ActiveRecord::Base
  has_paper_trail

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }

  default_scope { order(:name) }
end
