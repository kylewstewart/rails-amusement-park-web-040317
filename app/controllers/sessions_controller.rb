class SessionsController < ApplicationController

  def new

  end

  def create
    if !User.find_by(name: params[:name])
      redirect_to(new_user_path)
    else
      @user = User.find_by(name: params[:name])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

end
