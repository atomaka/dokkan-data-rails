class SuperAttack < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true

  def full
    "#{name} - #{description}"
  end
end
