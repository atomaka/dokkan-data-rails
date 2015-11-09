class Api::V1::CardSerializer < Api::V1::BaseSerializer
  attributes :character, :rarity, :type, :leader_skill, :passive_skill,
             :super_attack, :awaken_type, :dokkan_card, :links, :title,
             :gameid, :hp_stat, :atk_stat, :def_stat, :cost_stat

  private

  def links
    ActiveModel::ArraySerializer.new(
      object.links,
      each_serializer: Api::V1::LinkSerializer,
      root: false
    )
  end

  def character
    object.character.attributes.slice('name').values.first
  end

  def rarity
    object.rarity.attributes.slice('name').values.first
  end

  def type
    object.type.attributes.slice('name').values.first
  end

  def leader_skill
    if object.leader_skill
      object.leader_skill.attributes.slice('description').values.first
    end
  end

  def passive_skill
    if object.passive_skill
      object.passive_skill.attributes.slice('name', 'description')
    end
  end

  def super_attack
    if object.super_attack
      object.super_attack.attributes.slice('name', 'description')
    end
  end

  def awaken_type
    object.awaken_type.attributes.slice('name').values.first
  end

  def dokkan_card
    Api::V1::CardSerializer.new(object.dokkan_card, root: false)
  end

  def hp_stat
    stat_formatter(object.hp_stat)
  end

  def atk_stat
    stat_formatter(object.atk_stat)
  end

  def def_stat
    stat_formatter(object.def_stat)
  end

  def cost_stat
    stat_formatter(object.cost_stat)
  end

  private

  def stat_formatter(stat)
    stat.attributes.slice('min', 'max', 'awaken_min', 'awaken_max')
  end
end
