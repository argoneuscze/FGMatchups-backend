# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

char_list = [
    ['SO', 'Sol Badguy'],
    ['KY', 'Ky Kiske'],
    ['MI', 'Millia Rage'],
    ['ZA', 'Zato-1'],
    ['MA', 'May'],
    ['PO', 'Potemkin'],
    ['CH', 'Chipp Zanuff'],
    ['VE', 'Venom'],
    ['AX', 'Axl Low'],
    ['IN', 'I-No'],
    ['FA', 'Faust'],
    ['SL', 'Slayer'],
    ['RA', 'Ramlethal Valentine'],
    ['BE', 'Bedman'],
    ['SI', 'Sin Kiske'],
    ['EL', 'Elphelt Valentine'],
    ['LE', 'Leo Whitefang'],
    ['JO', 'Johnny'],
    ['JC', "Jack-O' Valentine"],
    ['JA', 'Jam Kuradoberi'],
    ['RV', 'Raven'],
    ['KU', 'Kum Haehyun'],
    ['DI', 'Dizzy'],
    ['BA', 'Baiken'],
    ['AS', 'Answer']
]

MatchupItem.destroy_all
Matchup.destroy_all
Character.destroy_all

db_chars = []

char_list.each do |ary|
  db_chars << Character.create(short_name: ary[0], full_name: ary[1])
end

db_chars.product(db_chars).each do |c1, c2|
  Matchup.create(char_as: c1, char_against: c2)
end
