class Client < User
  has_many :maintenances
  has_one :equipment, :through => :maintenances
  
  default_scope :conditions => {:role  => 'client'}
  
  # pose maintenance for an equipment
  # pose a new question for an equipment
  # view questions for her equipment
  
end