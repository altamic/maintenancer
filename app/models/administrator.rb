class Administrator < User
  default_scope :conditions => {:role  => 'administrator'}
  has_many :equipments, 
  has_many :maintenances
  
  # create new user with a role (client, technician, secretary)
end