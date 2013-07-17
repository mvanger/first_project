# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Team.delete_all
Pitcher.delete_all
Pitch.delete_all

t1 = Team.create(abbreviation: "BOS", city: "Boston", name: "Red Sox")
t2 = Team.create(abbreviation: "NYY", city: "New York", name: "Yankees")
t2 = Team.create(abbreviation: "TB", city: "Tampa Bay", name: "Rays")
t2 = Team.create(abbreviation: "TOR", city: "Toronto", name: "Blue Jays")
t2 = Team.create(abbreviation: "BAL", city: "Baltimore", name: "Orioles")

t2 = Team.create(abbreviation: "CWS", city: "Chicago", name: "White Sox")
t2 = Team.create(abbreviation: "KC", city: "Kansas City", name: "Royals")
t2 = Team.create(abbreviation: "MIN", city: "Minnesota", name: "Twins")
t2 = Team.create(abbreviation: "DET", city: "Detroit", name: "Tigers")
t2 = Team.create(abbreviation: "CLE", city: "Cleveland", name: "Indians")

t2 = Team.create(abbreviation: "HOU", city: "Houston", name: "Astros")
t2 = Team.create(abbreviation: "LAA", city: "Los Angeles", name: "Angels")
t2 = Team.create(abbreviation: "OAK", city: "Oakland", name: "Athletics")
t2 = Team.create(abbreviation: "SEA", city: "Seattle", name: "Mariners")
t2 = Team.create(abbreviation: "TEX", city: "Texas", name: "Rangers")

t2 = Team.create(abbreviation: "NYM", city: "New York", name: "Mets")
t2 = Team.create(abbreviation: "PHI", city: "Philadelphia", name: "Phillies")
t2 = Team.create(abbreviation: "ATL", city: "Atlanta", name: "Braves")
t2 = Team.create(abbreviation: "WSH", city: "Washington", name: "Nationals")
t2 = Team.create(abbreviation: "MIA", city: "Miami", name: "Marlins")

t2 = Team.create(abbreviation: "CHC", city: "Chicago", name: "Cubs")
t2 = Team.create(abbreviation: "MIL", city: "Milwaukee", name: "Brewers")
t2 = Team.create(abbreviation: "STL", city: "St. Louis", name: "Cardinals")
t2 = Team.create(abbreviation: "PIT", city: "Pittsburgh", name: "Pirates")
t2 = Team.create(abbreviation: "CIN", city: "Cincinnati", name: "Reds")

t2 = Team.create(abbreviation: "COL", city: "Colorado", name: "Rockies")
t2 = Team.create(abbreviation: "SD", city: "San Diego", name: "Padres")
t2 = Team.create(abbreviation: "SF", city: "San Francisco", name: "Giants")
t2 = Team.create(abbreviation: "LAD", city: "Los Angeles", name: "Dodgers")
t2 = Team.create(abbreviation: "ARI", city: "Arizona", name: "Diamondbacks")

puts "All done"
