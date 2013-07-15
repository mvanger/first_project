# Send pitchers into database?

require 'nokogiri'
require 'open-uri'

date = Date.today.prev_day
year = date.year
month = date.month
day = date.day

if day > 9
  root_url ="http://gd2.mlb.com/components/game/mlb/year_#{year}/month_0#{month}/day_#{day}/gid_#{year}_0#{month}_#{day}_/.../mlb_/.../mlb_1"
else
  root_url ="http://gd2.mlb.com/components/game/mlb/year_#{year}/month_0#{month}/day_0#{day}/gid_#{year}_0#{month}_0#{day}_/.../mlb_/.../mlb_1"
end

inning_url = root_url + "/inning/inning_all.xml"
pitcher_url = root_url + "/players.xml"

# Parses doc with Nokogiri
doc = File.open("inning_all.xml")
bb = Nokogiri::XML(doc)
doc.close

# Finds all pitches with speeds
speeds = bb.xpath("//@start_speed")

array = []

# Populates array with velocities as strings
speeds.max_by.each_with_object("start_speed") do |item, obj|
  array << "#{item}"
end

num_array = []

# Converts strings to floats
array.each do |num|
  num_array << num.to_f
end

# Finds fastest pitch (If tie, first instance of that velocity)
fastest = num_array.max

# Finds pitch number of fastest pitch
pitch_number = num_array.find_index(num_array.max)

atbat = speeds["#{pitch_number}".to_i].path

# This line doesn't work
test = bb.xpath("/game/inning[8]/bottom/atbat[1]")[0]

# Returns id of pitcher who threw fastest pitch
pitcher = test.attributes["pitcher"].value.to_i

# Opens players file
doc2 = File.open("../players.xml")
pp = Nokogiri::XML(doc2)
doc2.close

id_arr = []
first_arr = []
last_arr = []

# Puts IDs into array
pp.xpath("//player/@id").each do |id|
  id_arr << id.value
end

# Puts names into arrays
pp.xpath("//player/@first").each do |first|
  first_arr << first.value
end

pp.xpath("//player/@last").each do |last|
  last_arr << last.value
end

# Uses index of ID to find name
index = id_arr.find_index("#{pitcher}")
first = first_arr[index]
last = last_arr[index]
name = first + " " + last

# Returns pitcher and velo for the game
string = "#{name} threw the fastest pitch in this game at #{fastest} mph."
puts string