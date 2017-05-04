class SessionsController < ApplicationController

  def new

  end

  def create
    binding.pry
    if !User.find_by(name: "Bob")
      redirect_to
    else
      @user = User.find_by(name: "Bob")
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

end
