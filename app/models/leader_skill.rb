class LeaderSkill < ActiveRecord::Base
  has_paper_trail

  validates :description, presence: true,
                          uniqueness: { case_sensitive: false }

  default_scope { order(:description) }
end
