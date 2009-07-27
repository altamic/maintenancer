class Technician < User
  default_scope :conditions => {:role  => 'technician'}
end