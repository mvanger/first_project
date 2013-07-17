class PitchesController < ActionController::Base
  def index
    @pitch = Pitch.last
  end
end
