class SuperAttack < ActiveRecord::Base
  has_paper_trail

  validates :name, presence: true
  validates :description, presence: true

  default_scope { order(:name) }

  def full
    "#{name} - #{description}"
  end
end
