require 'open-uri'
require 'json'
require 'pp'

namespace :importer do
  rarities = ['n', 'r', 'sr', 'ssr', 'ur']
  types = [4, 3, 2, 5, 1]
  awaken_type = [1, 2]

  desc "Import from old api"
  task renzy: :environment do
    PaperTrail.whodunnit = 1

    cards = JSON.parse(open('http://dbzv2.renzy.land/action/cards') { |f| f.read })
    links = JSON.parse(open('http://api.dbzdokk.com/links') { |f| f.read })
    links = Hash[links.map { |link| [link['name'], link['description']] }]
    cards2 = JSON.parse(open('http://api.dbzdokk.com/characters') { |f| f.read })
    passives = Hash[cards2.map { |card| [card['gameid'], card['passive']] }]

    cards.each do |c|

      card = Hash.new
      card['gameid'] = c['id']
      card['title'] = c['name']['suffix']
      card['character'] = Character
                            .where(name: c['name']['prefix'])
                            .first_or_create
      card['rarity'] = Rarity
                            .where('lower(name) = ?', (c['rarity']['native']))
                            .first
      card['type'] = Type.where(id: types[c['type']['suffix'].to_i]).first

      if c['type']['prefix']
        card['awaken_type'] = types[c['type']['prefix'].to_i]
      end

      card['leader_skill'] = LeaderSkill
                              .where(description: c['leader_skill'])
                              .first_or_create
      card['super_attack'] = SuperAttack
                              .where(
                                name: c['super_atk']['name'],
                                description: c['super_atk']['desc']
                              )
                              .first_or_create
      passive_skill_description = !c['passive_skill']['decsc'].blank? ? c['passive_skill']['decsc'] : passives[card['gameid']]
      passive_skill = PassiveSkill
                              .where(
                                name: c['passive_skill']['name'],
                                description: passive_skill_description
                              ).first_or_initialize
      card['awaken_type'] = AwakenType.first
      card['passive_skill'] = passive_skill
      passive_skill.save(validate: false)
      card['links'] = Array.new
      c['link_skill'].each do |link|
        card['links'] << Link.where(
                          name: link,
                          description: links[link]
                         ).first_or_create
      end

      card['hp_stat'] = Stat.create(
                            min: c['stats']['native']['hp']['min'] || 0,
                            stat_type_id: 1
      )
      card['atk_stat'] = Stat.create(
                            min: c['stats']['native']['atk']['min'] || 0,
                            stat_type_id: 2
      )
      card['def_stat'] = Stat.create(
                            min: c['stats']['native']['def']['min'] || 0,
                            stat_type_id: 3
      )

      c = Card.create(card).save(validate: false)
    end
  end
end
