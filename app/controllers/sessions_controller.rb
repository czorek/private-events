class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user
      log_out
      log_in(@user)
      flash[:success] = "Logged in!"
    else
      flash.now[:danger] = 'No such user.'
      render 'sessions/new'
    end
  end

  def delete
    log_out
    redirect_to login_url
  end
end
