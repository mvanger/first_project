# Send pitchers into database?
# No games on Thursday
# Store in a database? p id, first, last, pitch, date
# Then I can call last date with a pitch
## And also work towards a leaderboard

require 'nokogiri'
require 'open-uri'
require 'pry'

date = Date.new(2013,7,14)
year = date.year
month = date.month
day = date.day

# This is for a previous day
# date = Date.today.prev_day
# year = date.year
# month = date.month
# day = date.day

# Pulls down index page
begin
  if day > 9
    data = Nokogiri::HTML(open("http://gd2.mlb.com/components/game/mlb/year_#{year}/month_0#{month}/day_#{day}/"))
  else
    data = Nokogiri::HTML(open("http://gd2.mlb.com/components/game/mlb/year_#{year}/month_0#{month}/day_0#{day}/"))
  end
rescue
end

# Puts hrefs into an array
gid = []

begin
  data.xpath("//@href").each do |item|
    gid << item.value
  end
rescue
end

# Selects those elements that begin with "gid_"
gid.select! { |a| a.include? "gid_" }

# This needs revision, using the new gid array
root_urls = []
gid.each do |game_id|
  if day > 9
    root_url = "http://gd2.mlb.com/components/game/mlb/year_#{year}/month_0#{month}/day_#{day}/" + game_id
  else
    root_url = "http://gd2.mlb.com/components/game/mlb/year_#{year}/month_0#{month}/day_0#{day}/" + game_id
  end
  root_urls << root_url
end

pitch_array = []
pitcher_id_array = []
pitcher_name_array = []

root_urls.each do |url|
  inning_url = url + "inning/inning_all.xml"
  pitcher_url = url + "players.xml"

  # Parses doc with Nokogiri
  begin
    bb = Nokogiri::XML(open("#{inning_url}"))

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
  rescue
  end

  unless pitch_number == nil
    atbat = speeds["#{pitch_number}".to_i].path

    # If more than 9 pitches in at bat
    if atbat[-16..-15].to_i > 9
      test = bb.xpath("#{atbat[0..-24]}")[0]
    else
      test = bb.xpath("#{atbat[0..-23]}")[0]
    end


    # Returns id of pitcher who threw fastest pitch
    pitcher = test.attributes["pitcher"].value.to_i

    begin
      pp = Nokogiri::XML(open("#{pitcher_url}"))

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

      # Leaders for each game
      pitch_array << fastest
      pitcher_id_array << pitcher
      pitcher_name_array << name
    rescue
    end
  end
end

# Leader for league
puts pitch_array.max

# Finds pitcher who threw fastest pitch
pitch_index = pitch_array.find_index(pitch_array.max)
if pitch_index != nil
  puts pitcher_name_array[pitch_index]
else
  puts "No pitches"
end
# puts pitcher_name_array.first