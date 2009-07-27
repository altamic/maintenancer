class Secretary < User
  default_scope :conditions => {:role => 'secretary'}
end