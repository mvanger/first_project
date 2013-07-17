class TeamsController < ApplicationController
  def index
    @user = User.first
  end
end
