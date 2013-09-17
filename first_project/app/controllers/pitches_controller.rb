class PitchesController < ApplicationController
  def index
    @pitch = Pitch.last
    # expires_in 3.seconds, public: true
  end

  def leaders
    @pitch = Pitch.all
    @pitcher = Pitcher.all
    @team = Team.all
    # expires_in 3.seconds, public: true

    @arr = []
    @pitch.each do |p|
      @arr << p.mph
    end

    @arr_2 = []
    @pitcher.each do |p|
      @arr_2 << p.pitches.size
    end
  end

  def about
    # expires_in 3.seconds, public: true
  end
end
