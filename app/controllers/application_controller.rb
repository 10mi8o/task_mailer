class ApplicationController < ActionController::Base
  #add 以下４行不要なら削除　検証用
  # before_action :set_current_user
  # def set_current_user
  #   @current_user = User.find_by(id: session[:user_id])
  # end

  protect_from_forgery with: :exception
  include SessionsHelper
end
