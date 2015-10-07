class LeaderSkill < ActiveRecord::Base
  validates :description, presence: true
end
