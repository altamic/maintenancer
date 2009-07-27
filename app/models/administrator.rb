class Administrator < User
  default_scope :conditions => {:role  => 'administrator'}
end