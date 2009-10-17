class Administrator < User
  default_scope :conditions => {:role  => 'administrator'}
  
  
  def equipments
    Equipment
  end
  
  def maintenances
    Maintenance
  end
end