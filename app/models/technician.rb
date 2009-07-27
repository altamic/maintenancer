class Technician < User
  default_scope :conditions => {:role  => 'technician'}
  
  # mark maintenance as completed
    
end