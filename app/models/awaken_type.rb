class AwakenType < ActiveRecord::Base
  validates :name, presence: true
end
