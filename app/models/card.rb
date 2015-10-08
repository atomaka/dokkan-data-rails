class Card < ActiveRecord::Base
  belongs_to :character
  belongs_to :rarity
  belongs_to :type
  belongs_to :leader_skill
  belongs_to :passive_skill
  belongs_to :super_attack
  belongs_to :awaken_type
  belongs_to :dokkan_card, class_name: 'Card', foreign_key: :dokkan_id

  has_and_belongs_to_many :links

  delegate :name, to: :character, prefix: false

  validates :title, presence: true
  validates :character, presence: true
  validates :gameid, presence: true,
                     numericality: { only_integer: true },
                     length: { is: 7 }
  validates :rarity, presence: true
  validates :type, presence: true
  validates :awaken_type, presence: true

  def dokkan?
    dokkan_id != nil
  end

  def full_name
    "#{title} #{character.name}"
  end

  def icon
    "card_#{gameid}_thumb.png"
  end
end
