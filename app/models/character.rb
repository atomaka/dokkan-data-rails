class Character < ActiveRecord::Base
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }

  default_scope { order(:name) }
end
