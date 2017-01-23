class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :ensure_login
  helper_method :logged_in?, :current_user

  protected
	    def ensure_login
	      # Hace un redirect a la pagina de login siempre y cuando
	      # no exista nada en session[:user_id]
	      redirect_to login_path unless session[:user_id]
	    end

	    def logged_in?
	      session[:user_id]
	    end

	    def current_user
	      @current_user ||= User.find(session[:user_id])
	    end
end
