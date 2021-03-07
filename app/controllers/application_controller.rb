class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  def self.all_except(user)
    where.not(id: user)
  end

  # def index
  #   # @users = User.all_except(current_user).paginate
  #   @users = User.all
  # end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :last_name, :first_name, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :last_name, :first_name, :avatar])
  end

  def layout_by_resource
    if devise_controller?
      'devise'
    else
      'application'
    end
  end
end
