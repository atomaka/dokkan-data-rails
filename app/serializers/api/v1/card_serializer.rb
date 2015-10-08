class Api::V1::CardSerializer < Api::V1::BaseSerializer
  attributes :id, :character, :rarity, :type, :leader_skill, :passive_skill,
             :super_attack, :awaken_type, :dokkan_card, :links, :title,
             :gameid

  private

  def links
    ActiveModel::ArraySerializer.new(
      object.links,
      each_serializer: Api::V1::LinkSerializer,
      root: false
    )
  end

  def character
    Api::V1::CharacterSerializer.new(object.character)
  end

  def rarity
    Api::V1::RaritySerializer.new(object.rarity)
  end

  def type
    Api::V1::TypeSerializer.new(object.type)
  end

  def leader_skill
    Api::V1::LeaderSkillSerializer.new(object.leader_skill)
  end

  def passive_skill
    Api::V1::PassiveSkillSerializer.new(object.passive_skill)
  end

  def super_attack
    Api::V1::SuperAttackSerializer.new(object.super_attack)
  end

  def awaken_type
    Api::V1::AwakenTypeSerializer.new(object.awaken_type)
  end

  def dokkan_card
    Api::V1::CardSerializer.new(object.dokkan_card)
  end
end
