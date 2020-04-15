class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user=(user)
    current_user = user
  end
  
end
