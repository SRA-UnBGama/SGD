class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    root_path
  end
  
  before_filter  :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:user) { |u| u.permit(:name_user, :fub_registry, :siape_registry, :cost_center, :admission_date, :password, :password_confirmation)}
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name_user, :fub_registry, :siape_registry, :cost_center, :admission_date, :password, :password_confirmation)}
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:fub_registry, :password)}
  end

end
