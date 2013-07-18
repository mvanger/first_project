class PitchesController < ApplicationController
  def index
    @pitch = Pitch.last
  end

  def leaderboards
    @pitch = Pitch.all
    @pitcher = Pitcher.all
    @team = Team.all
  end
end
