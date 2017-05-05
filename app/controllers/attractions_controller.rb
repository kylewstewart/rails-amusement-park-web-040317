class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def edit
    if @user.admin
      @attraction = Attraction.find(params[:id])
    else
      render :show
    end
  end

  def new
    if @user.admin
      @attraction = Attraction.new
    else
      render :index
    end
  end

end
