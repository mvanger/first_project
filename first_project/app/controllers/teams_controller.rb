class TeamsController < ApplicationController
  def index
    if current_user == nil
      redirect_to root_url
    end

    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
