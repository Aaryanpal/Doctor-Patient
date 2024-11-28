class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :authenticate_user!
  before_action :set_dashboard
  allow_browser versions: :modern
  
#FIXME this needs to be set at dashboard controller
  def set_dashboard
    return if current_user.nil?
    if current_user.has_role?(:doctor)
      @dashboard_view = 'doctor_dashboard'
    elsif current_user.has_role?(:receptionist)
      @dashboard_view = 'receptionist_dashboard'
    end
  end

  def after_sign_in_path_for(resource)
    dashboards_path
  end

end
