class PitchesController < ApplicationController
  def index
    @pitch = Pitch.last
  end

  def leaders
    @pitch = Pitch.all
    @pitcher = Pitcher.all
    @team = Team.all

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
  end
end
