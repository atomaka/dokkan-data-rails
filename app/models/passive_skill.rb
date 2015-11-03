class PassiveSkill < ActiveRecord::Base
  has_paper_trail

  validates :description, presence: true,
                          uniqueness: { scope: :name }

  default_scope { order(:name) }

  def full
    "#{display_name} - #{description}"
  end

  def display_name
    name.present? ? name : 'UNNAMED'
  end

  def self.issues
    PassiveSkill.where("name = '' OR description = ''")
  end
end
