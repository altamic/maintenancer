# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def role_class(user)
    classify.constantize ||= User
  end
end
