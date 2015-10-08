class PassiveSkill < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true

  default_scope { order(:name) }
end
