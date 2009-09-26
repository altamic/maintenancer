module UsersHelper
  def administrator_area(user, &block)
    (current_user_role.is_a? Administrator) && concat(content_tag(:div, capture(&block)))
  end
  
  def secretary_area(user, &block)
    (current_user_role.is_a? Secretary) && concat(content_tag(:div, capture(&block)))
  end
  
  def technician_area(user, &block)
    (current_user_role.is_a? Technician) && concat(content_tag(:div, capture(&block)))
  end
  
  def client_area(user, &block)
    (current_user_role.is_a? Client) && concat(content_tag(:div, capture(&block)))
  end

  def to_class(string)
    string.classify.constantize
  end
  
  # def concat_div(&block)
  #   concat(content_tag(:div), capture(block)))
  # end
  
  # %w(administrator secretary technician client).each do |role|
  #   define_method "#{role}_area" do |user|
  #     (current_user_role.is_a? role.to_class) && concat_div(yield) if block_given?
  #   end
  # end
  
  def pending_maintenances
    equipment.maintenances.incoming.pending
  end
end
