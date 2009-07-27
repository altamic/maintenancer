class Administrator < User
  default_scope :conditions => {:role  => 'administrator'}
  
  # create new user with a role (client, technician, secretary)
end