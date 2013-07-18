class TeamsController < ApplicationController
  def index
    if current_user == nil
      redirect_to root_url
    end

    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def search
    @teams = Team.find_all_by_city(params[:input].titleize)

    if @teams.empty?
      @teams = Team.find_all_by_name(params[:input].titleize)
    end

    if @teams.empty?
      name = params[:input].titleize
      if name.split.size == 2
        city = name.split.first
        mascot = name.split.last
        @teams = Team.where("city = ? AND name = ?", city, mascot)
      elsif name.split.size == 3
        city = name.split.first
        mascot = "#{name.split[1]} #{name.split[2]}"
        @teams = Team.where("city = ? AND name = ?", city, mascot)
      end
    end

    if @teams.empty?
      name = params[:input].titleize
      city = "#{name.split[0]} #{name.split[1]}"
      mascot = name.split.last
      @teams = Team.where("city = ? AND name = ?", city, mascot)
    end
  end

  def favorite
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @team = Team.find_by_abbreviation(params[:abbreviation])

    if @current_user.teams.include? @team
      redirect_to "/teams"
    else
      @current_user.teams << @team
      redirect_to "/teams"
    end
  end
end
