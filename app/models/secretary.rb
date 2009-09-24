class Secretary < User
  default_scope :conditions => {:role => 'secretary'}
  
  attr_protected :role
  # review maintenance proposed by client
  # review recent questions
  
end