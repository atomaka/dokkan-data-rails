class CardsLink < ActiveRecord::Base
  belongs_to :card
  belongs_to :link
end
