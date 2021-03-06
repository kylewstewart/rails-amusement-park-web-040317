class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if !User.find_by(user_params(:name))
      redirect_to new_user_path
    else
      @user = User.find_by(user_params(:name))
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end


end
