class Secretary < User
  default_scope :conditions => {:role => 'secretary'}
  
  # review maintenance proposed by client
  # review recent questions
  
end