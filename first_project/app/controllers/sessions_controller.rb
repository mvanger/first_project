class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to root_url
    end
  end

  def create
    user = User.authenticate(params[:screenname], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Invalid screenname or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
