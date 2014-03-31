class PitchesController < ApplicationController
  def index
    @pitch = Pitch.last
    # expires_in 3.seconds, public: true
  end

  def leaders
    @pitch = Pitch.where("year = ?", 2014)
    @pitcher = Pitcher.all
    @team = Team.all
    # expires_in 3.seconds, public: true

    @arr = []
    @pitch.each do |p|
      @arr << p.mph
    end

    @arr_2 = []
    @pitcher.each do |p|
      i = 0
      p.pitches.each do |k|
        if k.year == 2014
          i += 1
        end
      end
      @arr_2 << i
    end
  end

  def about
    # expires_in 3.seconds, public: true
  end
end
