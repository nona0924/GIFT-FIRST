class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_host

  def set_host
    Rails.application.routes.default_url_options[:host] = request.host_with_port
  end
  # protected

  # def configure_permitted_parameters
  #   added_attrs = [:name, :birdhday, :gender, :user_type, :icon, :email, :password, :password_confirmation, :remember_me]
  #   devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  #   devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  # end
end
