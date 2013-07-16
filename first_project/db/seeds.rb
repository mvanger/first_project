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

u1 = User.create(screenname: "Mike", email: "mvanger@nyu.edu", password: "password")

t1 = Team.create(abbreviation: "BOS", city: "Boston", name: "Red Sox")
t2 = Team.create(abbreviation: "CIN", city: "Cincinnati", name: "Reds")

p1 = Pitcher.create(mlb_id: 523234, first: "Jon", last: "Lester")
p2 = Pitcher.create(mlb_id: 132341, first: "Aroldis", last: "Chapman")
p3 = Pitcher.create(mlb_id: 124212, first: "Mat", last: "Latos")

f1 = Pitch.create(mph: 95)
f2 = Pitch.create(mph: 100)
f3 = Pitch.create(mph: 97.5)
f4 = Pitch.create(mph: 99.3)
f5 = Pitch.create(mph: 101.4)

puts "All done"
