module UsersHelper
  def administrator_area(user, &block)
    concat content_tag(:div, capture(&block)) if user.role == 'administrator'
  end
  
  def secretary_area(user, &block)
    concat content_tag(:div, capture(&block)) if user.role == 'secretary'
  end
  
  def technician_area(user, &block)
    concat content_tag(:div, capture(&block)) if user.role == 'technician'
  end
  
  def client_area(user, &block)
    concat content_tag(:div, capture(&block)) if user.role == 'client'
  end

  def classify_from_role(user)
    user.role.classify.constantize.find(user.id) if user.respond_to?(:role)
  end
  
  def pending_maintenances
    equipment.maintenances.incoming.pending
  end
end
