desc "This task is called by the Heroku scheduler add-on"
task :update_pitches => :environment do
  # Send pitchers into database?
  # No games on Thursday
  # Store in a database? p id, first, last, pitch, date
  # Then I can call last date with a pitch
  ## And also work towards a leaderboard

  require 'nokogiri'
  require 'open-uri'

  date_1 = Date.new(2013,4,8)
  date_2 = Date.new(2013,7,14)
  date_array = (date_1..date_2).map{|day| day}

  date_array.each do |date|
    year = date.year
    month = date.month
    day = date.day

  # date = Date.new(2013,7,14)
  # year = date.year
  # month = date.month
  # day = date.day

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
  pitcher_first_name_array = []
  pitcher_last_name_array = []
  pitcher_name_array = []
  pitcher_team_array = []

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
        team_arr = []

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

        pp.xpath("//player/@team_abbrev").each do |team|
          team_arr << team.value
        end

        # Uses index of ID to find name
        index = id_arr.find_index("#{pitcher}")
        first = first_arr[index]
        last = last_arr[index]
        team = team_arr[index]
        name = first + " " + last

        # Leaders for each game
        pitch_array << fastest
        pitcher_id_array << pitcher
        pitcher_name_array << name
        pitcher_first_name_array << first
        pitcher_last_name_array << last
        pitcher_team_array << team
      rescue
      end
    end
  end

  # Leader for league
  # puts pitch_array.max
  # Finds pitcher who threw fastest pitch
  pitch_index = pitch_array.find_index(pitch_array.max)
  if pitch_index != nil
    pitcher_name_array[pitch_index]
  else
    "No pitches"
  end
  # @pitcher_team_array[pitch_index]

  unless pitch_array.max == nil
    fastball = Pitch.create
    fastball.mph = pitch_array.max
    @hurler = Pitcher.find_by_mlb_id("#{pitcher_id_array[pitch_index]}")
    if @hurler == nil
      @hurler = Pitcher.create(mlb_id: "#{pitcher_id_array[pitch_index]}")      # @hurler = Pitcher.find_by_mlb_id("#{pitcher_id_array[pitch_index]}")
    end
    @hurler.first = pitcher_first_name_array[pitch_index]
    @hurler.last = pitcher_last_name_array[pitch_index]
    squad = Team.find_by_abbreviation("#{pitcher_team_array[pitch_index]}")
    unless squad.pitchers.include? @hurler
      squad.pitchers << @hurler
    end
    @hurler.pitches << fastball
    fastball.save
    @hurler.save
    squad.save
  end
end
end