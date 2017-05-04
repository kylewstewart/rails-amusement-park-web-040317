class UsersController < ApplicationController

  before_action :authorize_user, except: [:new, :create, :index]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:name, :password, :nausea, :happiness, :tickets, :height))
    if @user.save
      redirect_to new_session_path
      # save session ...
      
    else
      render :new
    end
  end

  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end

end
