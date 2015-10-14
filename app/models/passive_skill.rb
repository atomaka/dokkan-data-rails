class PassiveSkill < ActiveRecord::Base
  has_paper_trail

  validates :name, presence: true
  validates :description, presence: true

  default_scope { order(:name) }
end
