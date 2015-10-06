class Card < ActiveRecord::Base
  belongs_to :character
  belongs_to :rarity
  belongs_to :type
  belongs_to :leader_skill
  belongs_to :passive_skill
  belongs_to :super_attack
  belongs_to :awaken_type
  has_one :dokkan_card, class_name: 'Card', foreign_key: :dokkan_id

  has_and_belongs_to_many :links

  delegate :name, to: :character, prefix: false

  validates :prefix, presence: true
  validates :character, presence: true
  validates :gameid, presence: true,
                     numericality: { only_integer: true },
                     length: { is: 7 }
  validates :rarity, presence: true
  validates :type, presence: true
  validates :awaken_type, presence: true

  def dokkan?
    self.dokkan_id != nil
  end
end
