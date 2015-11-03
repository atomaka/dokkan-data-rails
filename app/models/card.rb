class Card < ActiveRecord::Base
  has_paper_trail

  after_create :set_stat_types

  belongs_to :character
  belongs_to :rarity
  belongs_to :type
  belongs_to :leader_skill
  belongs_to :passive_skill
  belongs_to :super_attack
  belongs_to :awaken_type
  belongs_to :dokkan_card, class_name: 'Card', foreign_key: :dokkan_id

  has_and_belongs_to_many :links, counter_cache: true

  has_many :evidences

  belongs_to :hp_stat, class_name: 'Stat'
  belongs_to :atk_stat, class_name: 'Stat'
  belongs_to :def_stat, class_name: 'Stat'

  accepts_nested_attributes_for :hp_stat
  accepts_nested_attributes_for :atk_stat
  accepts_nested_attributes_for :def_stat

  delegate :name, to: :character, prefix: false

  validates :title, presence: true
  validates :character, presence: true
  validates :gameid, presence: true,
                     numericality: { only_integer: true },
                     length: { is: 7 }
  validates :rarity, presence: true
  validates :type, presence: true
  validates :awaken_type, presence: true

  default_scope { order(:gameid) }

  def dokkan?
    dokkan_id != nil
  end

  def full_name
    "#{title} #{character.name}"
  end

  def icon
    "card_#{gameid}_thumb.png"
  end

  private

  def set_stat_types
    self.hp_stat.stat_type_id = 1
    self.atk_stat.stat_type_id = 2
    self.def_stat.stat_type_id = 3

    self.save
  end
end
