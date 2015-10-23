class PassiveSkill < ActiveRecord::Base
  has_paper_trail

  validates :name, presence: true
  validates :description, presence: true,
                          uniqueness: { scope: :name }

  default_scope { order(:name) }

  def full
    "#{name} - #{description}"
  end
end
