class AccountActivationsController < ApplicationController
  skip_before_action :ensure_login, only: [:edit]

  def edit
    user = User.find_by(email: params[:email])

      if user && !user.status? && user.authenticated?(:activation, params[:id])
		user.activate
        log_in user
        flash[:success] = "Account activated!"
        redirect_to user
      else
        flash[:danger] = "Invalid activation link"
        redirect_to root_url
    end

  end

end
