class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helpers do 

    def current_user_is_admin?
      User.find(session[:user_id]).admin
    end

  end

end
