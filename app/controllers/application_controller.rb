# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  helper_method :current_user, :user_role, :current_user_role, 
                User::ROLES.map{|x| "#{x}?".to_sym},
                User::ROLES.map{|x| "not_#{x}?".to_sym}
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = (current_user_session && current_user_session.record)
  end
  
  def current_user_role
    user_role(current_user) if not current_user.nil?
  end
  
  def authorize
    if current_user.nil?
      flash[:error] = "Unauthorized access"
      redirect_to root_url
      false
    end
  end
  
  def user_role(user)
    !user.nil? && user.role.classify.constantize.find(user)
  end
end
