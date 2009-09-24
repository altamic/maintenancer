module UsersHelper
  %w(administrator secretary technician client).each do |role|
    define_method "#{role}_area" do |user, block|
      concat content_tag(:div, capture(&block)) if current_user_role.is_a? role.classify.constantize
    end
  end
  
  def administrator_area(user, &block)
    concat content_tag(:div, capture(&block)) if current_user_role.is_a? Administrator
  end
  
  def secretary_area(user, &block)
    concat content_tag(:div, capture(&block)) if current_user_role.is_a? Secretary
  end
  
  def technician_area(user, &block)
    concat content_tag(:div, capture(&block)) if current_user_role.is_a? Technician
  end
  
  def client_area(user, &block)
    concat content_tag(:div, capture(&block)) if current_user_role.is_a? Client
  end

  def pending_maintenances
    equipment.maintenances.incoming.pending
  end
end
