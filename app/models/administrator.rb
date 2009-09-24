class Administrator < User
  default_scope :conditions => {:role  => 'administrator'}
  has_many :equipments,   :class_name => "Equipment",
                          :finder_sql => ""
  has_many :maintenances, :class_name => "Maintenance", 
                          :finder_sql => ""
  
  # create new user with a role (client, technician, secretary)
end