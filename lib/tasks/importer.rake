require 'open-uri'
require 'json'
require 'pp'

namespace :importer do
  types = [4, 3, 2, 5, 1]
  awaken_type = [1, 2]

  desc "Import from old api"
  task renzy: :environment do
    PaperTrail.whodunnit = 1

    cards = JSON.parse(open('http://dbzv2.renzy.land/action/cards') { |f| f.read })
    links = JSON.parse(open('http://api.dbzdokk.com/links') { |f| f.read })
    links = Hash[links.map { |link| [link['name'], link['description']] }]

    cards.each do |c|

      card = Hash.new

      # easy stuff
      card['gameid'] = c['id']
      card['title'] = c['name']['suffix']
      card['awaken_type'] = AwakenType.first

      # relational stuff
      card['type'] = Type.where(id: types[c['type']['suffix'].to_i]).first
      card['character'] = Character
                            .where(name: c['name']['prefix'])
                            .first_or_create
      card['rarity'] = Rarity
                            .where('lower(name) = ?', (c['rarity']['native']))
                            .first
      card['leader_skill'] = LeaderSkill
                              .where(description: c['leader_skill'])
                              .first_or_create
      card['super_attack'] = SuperAttack
                              .where(
                                name: c['super_atk']['name'],
                                description: c['super_atk']['desc']
                              )
                              .first_or_create

      # passives (in case we don't have the description
      card['passive_skill'] = PassiveSkill
                              .where(
                                name: c['passive_skill']['name'],
                                description: c['passive_skill']['desc']
                              ).first_or_initialize
      card['passive_skill'].save(validate: false)

      # links (need links description from my store, some missing, but fine)
      card['links'] = Array.new
      c['link_skill'].each do |link|
        card['links'] << Link.where(
                          name: link,
                          description: links[link]
                         ).first_or_create
      end

      # stats
      card['hp_stat'] = Stat.create(
        min: c['stats']['native']['hp']['min'] || 0,
        max: c['stats']['native']['hp']['max'] || 0,
        awaken_min: c['stats']['awoken']['hp']['min'] || 0,
        awaken_max: c['stats']['awoken']['hp']['max'] || 0,
        stat_type_id: 1
      )
      card['atk_stat'] = Stat.create(
        min: c['stats']['native']['atk']['min'] || 0,
        max: c['stats']['native']['atk']['max'] || 0,
        awaken_min: c['stats']['awoken']['atk']['min'] || 0,
        awaken_max: c['stats']['awoken']['atk']['max'] || 0,
        stat_type_id: 2
      )
      card['def_stat'] = Stat.create(
        min: c['stats']['native']['def']['min'] || 0,
        max: c['stats']['native']['def']['max'] || 0,
        awaken_min: c['stats']['awoken']['def']['min'] || 0,
        awaken_max: c['stats']['awoken']['def']['max'] || 0,
        stat_type_id: 3
      )

      c = Card.create(card).save(validate: false)
    end
  end
end
