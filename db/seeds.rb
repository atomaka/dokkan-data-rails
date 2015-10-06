types = [
  ['Physical', 'PHY', 'yellow'],
  ['Intellect', 'INT', 'purple'],
  ['Technique', 'TEQ', 'green'],
  ['Agility', 'AGL', 'blue'],
  ['Strength', 'STR', 'red'],
]

rarities = [
  ['Normal', 'N'],
  ['Rare', 'R'],
  ['Super Rare', 'SR'],
  ['Super Super Rare', 'SSR'],
  ['Ultra Rare', 'UR'],
]

awaken_types = [
  'Super',
  'Extreme',
]

types.each do |description, name|
  Type.create(name: name, description: description)
end

rarities.each do |description, name|
  Rarity.create(name: name, description: description)
end

awaken_types.each do |name|
  AwakenType.create(name: name)
end
