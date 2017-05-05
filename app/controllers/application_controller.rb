class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user = User.find_by(id: sessions[:user_id])
  end

  def authorize_user
    if !logged_in?
      flash[:notice] = "You are not authorized to peform this action"
      redirect_to '/'
    end
  end

  def logged_in?
    !!session[:user_id]
  end

end
