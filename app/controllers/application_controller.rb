class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    root_path
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.default_message = "Não autorizado a fazer esta ação"
  end

  before_filter  :configure_permitted_parameters, if: :devise_controller?

  def permission_about_phase(phase_name)
      periods_in_progress = EvaluationPeriod.where(:status_evaluation_period => "Em Andamento")

      result = false

      if periods_in_progress.count == 1
        phase = periods_in_progress.first.phases.find_by_phase_name(phase_name)

        if phase.status_phase = "Em Andamento"
          result = true
        else
          # Nothing To Do
        end
      else
       # Nothing To Do
      end
      result
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:user) { |u| u.permit(:name_user, :fub_registry, :siape_registry, :cost_center, :admission_date, :password, :password_confirmation)}
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name_user, :fub_registry, :siape_registry, :cost_center, :admission_date, :password, :password_confirmation)}
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:fub_registry, :password)}
  end

end
