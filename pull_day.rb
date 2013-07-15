require 'greenmonster'
require 'fileutils'

Greenmonster.set_games_folder('/Users/Mike/components/game')

bb = Greenmonster::Spider.new

array = bb.pull_day(Date.today.prev_day, 'mlb')

array.each do |gid|
  bb.pull_game(gid.chop, Date.today.prev_day)
end

FileUtils.rm_rf('/Users/Mike/components/game/lb_')