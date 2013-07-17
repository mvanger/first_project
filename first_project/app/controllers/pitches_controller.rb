class PitchesController < ApplicationController
  def index
    @pitch = Pitch.last
  end
end
